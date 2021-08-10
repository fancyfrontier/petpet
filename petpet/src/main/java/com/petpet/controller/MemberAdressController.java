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
public class MemberAdressController {
	
	@Autowired
	private MemberService memberService;
	
	//進入修改常用配送(需驗證)
	@GetMapping("/member/MemberAdress")
	public String toMemberAdress(HttpServletRequest request, Model m) {
		Integer memberid = (Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findById(memberid);
		m.addAttribute("member", member);
		return "MemberAdress";
	}
	
	//更新會員資料
	@PostMapping("/UpdateMemberAdress")
	public String updateMemberEdit(@RequestParam(name = "memberid") Integer memberid, 
									HttpServletRequest request, Model m) {
				
		Member member = memberService.findById(memberid);
				
		member.setPostname(request.getParameter("postname"));
		member.setPostmobile(request.getParameter("postmobile"));
		member.setCity(request.getParameter("city"));
		member.setRegion(request.getParameter("region"));
		member.setPostalcode(request.getParameter("postalcode"));
		member.setAddress(request.getParameter("address"));
				
		memberService.save(member);
		m.addAttribute("member", member);
				
		return "MemberCenter";
	}
}
