package com.petpet.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petpet.model.Member;
import com.petpet.service.MemberService;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	//會員總覽
	@GetMapping("/AdminShowAllMembers")
	public String adminShowAllMembers(Model m) {
		List<Member> memberData = memberService.findAll();
		m.addAttribute("memberData", memberData);
		return "AdminShowAllMembers";
	}
	
	//顯示要修改的會員資料並送到修改頁面
	@GetMapping("/AdminShowMember")
	public String adminShowMember(@RequestParam("memberid") Integer memberid, Optional<Member> Member, Model model) {
		try {
			if (memberid != 0) {
				Member = memberService.adminFindById(memberid);
				if (Member.isPresent()) {
					model.addAttribute("memberid", Member.get().getMemberid());
					model.addAttribute("fullname", Member.get().getFullname());
					model.addAttribute("gender", Member.get().getGender());
					model.addAttribute("birthday", Member.get().getBirthday());
					model.addAttribute("mobile", Member.get().getMobile());
					model.addAttribute("postalcode", Member.get().getPostalcode());
					model.addAttribute("city", Member.get().getCity());
					model.addAttribute("region", Member.get().getRegion());
					model.addAttribute("address", Member.get().getAddress());
					return "AdminUpdateMember";
				}
				return "redirect:/AdminShowAllMembers";  
			}
		return "redirect:/AdminShowAllMembers";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/AdminShowAllMembers";
		}	
	}
	
	//將修改的會員資料存入資料庫
	@PostMapping("/AdminUpdateMember")
	public @ResponseBody ResponseEntity<?> adminUpdateMember (@RequestParam("fullname") String fullname, 
															  @RequestParam("memberid") Integer memberid, 
															  @RequestParam("gender") String gender,
															  @RequestParam("birthday") String birthday, 
															  @RequestParam("mobile") String mobile,
															  @RequestParam("postalcode") String postalcode,
															  @RequestParam("city") String city,
															  @RequestParam("region") String region,
															  @RequestParam("address") String address,
															  Model model, HttpServletRequest request,
															  final @RequestParam(value="image",  required = false) MultipartFile file){
		try {
			Member member = memberService.adminFindById(memberid).orElse(null);	
			byte[] imageData1= member.getPhoto();
			member.setPhoto(imageData1);
			System.out.println("這裡是image:"+imageData1);
			//檔案不為空才讀取檔案,否則就用原本資料庫裏面的檔案
			if (!file.isEmpty()) {	
				byte[] imageData = file.getBytes();
				member.setPhoto(imageData);
			}
			member.setFullname(fullname);
			member.setGender(gender);
			member.setBirthday(birthday);
			member.setMobile(mobile);
			member.setPostalcode(postalcode);
			member.setCity(city);
			member.setRegion(region);
			member.setAddress(address);
			memberService.save(member);
			return new ResponseEntity<>("Member Saved With File", HttpStatus.OK);
		}	
		catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
	
	//匯出資料庫圖片
	@GetMapping("/product/display/{memberid}")
	@ResponseBody
	public void showImage(@PathVariable("memberid") Integer memberid, HttpServletResponse response, Optional<Member> member) throws ServletException, IOException {
		member = memberService.adminFindById(memberid);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(member.get().getPhoto());
		response.getOutputStream().close();
	}
	
	
	//刪除會員資料
	@GetMapping("/delproduct")
	public String deleteProduct(@RequestParam("memberid") Integer memberid, HttpServletResponse response,Model model) {
		try {
			if (memberid != 0) {
			Optional<Member> member = memberService.adminFindById(memberid);
				if (member.isPresent()) {
					memberService.deleteById(memberid);
					List<Member> memberData = memberService.findAll();
					model.addAttribute("memberData", memberData);
					return "AdminShowAllMembers";
				}
				return "redirect:/AdminShowAllMembers";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/AdminShowAllMembers";
		}
		return "redirect:/AdminShowAllMembers";	
	}
	
	
	
}
