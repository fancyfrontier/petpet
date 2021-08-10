package com.petpet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petpet.model.Member;
import com.petpet.service.MemberService;

@Controller
public class MemberEditController {
	
	@Autowired
	private MemberService memberService;
	
	
	//進入修改會員(需驗證)
	@GetMapping("/member/MemberEdit")
	public String toMemberEdit(HttpServletRequest request, Model m) {
		Integer memberid = (Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findById(memberid);
		m.addAttribute("member", member);
		return "MemberEdit";
	}
	
	
	//更新會員資料
		@PostMapping("/UpdateMemberEdit")
		public String updateMemberEdit(@RequestParam(name = "memberid") Integer memberid, 
										HttpServletRequest request, Model m,
										final @RequestParam(name="image",  required = false) MultipartFile file) throws IOException {
			
			Member member = memberService.findById(memberid);
			byte[] imageData1= member.getPhoto();
			
			member.setPhoto(imageData1);
			if (!file.isEmpty()) {	
				byte[] imageData = file.getBytes();
				member.setPhoto(imageData);
			}
			
			member.setFullname(request.getParameter("fullname"));
			member.setGender(request.getParameter("gender"));
			member.setBirthday(request.getParameter("birthday"));
			member.setMobile(request.getParameter("mobile"));
			
			memberService.save(member);

			m.addAttribute("member", member);
			
			return "MemberCenter";
		}
}
