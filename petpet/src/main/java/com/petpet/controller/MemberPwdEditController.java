package com.petpet.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petpet.model.Member;
import com.petpet.service.MemberService;
import com.petpet.util.AESUtil;

@Controller
public class MemberPwdEditController {
	
	@Autowired
	private MemberService memberService;
	
	//進入修改會員(需驗證)
	@GetMapping("/member/MemberPwdEdit")
	public String toMemberPwdEdit(HttpServletRequest request, Model m) {
		Integer memberid = (Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findById(memberid);
		m.addAttribute("member", member);
		return "MemberPwdEdit";
	}
	
	//驗證原本的密碼,決定是否解鎖修改鍵
	@PostMapping("/CheckPasswordExist")
	public @ResponseBody Map<String, String> checkPasswordExist(@RequestParam(value = "oldpassword") String oldpassword,
																HttpServletRequest request, Model m) {
		String id = "";
		Map<String, String> map = new HashMap<>();
		Integer memberid = (Integer)(request.getSession().getAttribute("memberid"));
		Member checkPassword = memberService.findByPasswordAndMemberid(AESUtil.encryptString(oldpassword), memberid);

		if(checkPassword != null) {
			map.put("oldpassword", id);
			return map;
		}else {
			id = "accountNotNull";
			map.put("oldpassword", id);
			return map;
		}
	}
	
	//更新密碼並強制登出
	@PostMapping("/UpdateMemberPwdEdit")
	public String updateMemberEdit(@RequestParam(name = "memberid") Integer memberid, 
								   @RequestParam(name = "newpassword") String newpassword,
								   HttpServletRequest request, Model m) {
			
		Member member = memberService.findById(memberid);
		member.setPassword(AESUtil.encryptString(newpassword));
		memberService.save(member);
		request.getSession().invalidate();
			
		return "/Tip/MemberUpdatePwdTip";
	}
	
}
