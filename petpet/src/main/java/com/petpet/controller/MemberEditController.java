package com.petpet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
									HttpServletRequest request, Model m) {
		Member member = memberService.findById(memberid);
		member.setFullname(request.getParameter("fullname"));
		member.setGender(request.getParameter("gender"));
		member.setBirthday(request.getParameter("birthday"));
		member.setMobile(request.getParameter("mobile"));
		memberService.save(member);

		m.addAttribute("member", member);
		
		return "MemberCenter";
	}
	
}
