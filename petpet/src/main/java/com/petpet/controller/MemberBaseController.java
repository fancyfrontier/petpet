package com.petpet.controller;

import java.io.IOException;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpet.model.Member;
import com.petpet.service.MemberService;
import com.petpet.util.AESUtil;
import com.petpet.util.SendEmailService;
import com.petpet.util.Utility;

import io.lettuce.core.dynamic.annotation.Param;
import net.bytebuddy.utility.RandomString;

@Controller
public class MemberBaseController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private SendEmailService sendEmail;
	
	//首頁
	@GetMapping({"/", "/index"})
	public String showIndex() {
		return "index";
	}

	//使用攔截器強制轉入登入頁面
	@GetMapping("/PleaseLogin")
	public String pleaseLogin() {
		return "MemberLogin";
	}
	
	//進入會員中心(需驗證)
	@GetMapping("/member/MemberCenter")
	public String toMemberCenter(HttpServletRequest request, Model m) {
		Integer memberid = (Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findById(memberid);
		m.addAttribute("member", member);
		return "MemberCenter";
	}

	//進行註冊設定並送出驗證信,回傳空值是因為送出表單前會先被判斷式鎖住按鈕(RESTful)
	@PostMapping("/Registermember")
	public String registermember(@RequestParam(name = "email") String email, 
								 @RequestParam(name = "password") String password,
								 HttpServletRequest request, Model m) throws Exception {
		
		Member checkMember = memberService.findByEmail(email);
		if(checkMember == null) {
			Member member = new Member();
			member.setCreatetime(new Date());
			member.setEnabled(false);
			member.setEmail(email);
			member.setPassword(AESUtil.encryptString(password));
			
			String randomCode = RandomString.make(64);
			member.setVerificationcode(randomCode);
			
			String siteURL = Utility.getSiteURL(request);
			memberService.save(member);
			sendEmail.sendMail(member, siteURL);

			member = memberService.findByEmail(email);
			m.addAttribute("member", member);
			return "Tip/MemberCheckMailTip";
		}else {
			return null;
		}
	}
	
	//檢查帳號密碼是否存在並確認是否開通過驗證信
	@PostMapping("/Login")
	public @ResponseBody Map<String, String> checkLoginEmail(@RequestParam(value = "loginEmail") String loginEmail,
															@RequestParam(value = "loginPassword") String loginPassword,
															HttpServletRequest request, Model m) {
		String id = "";
		
		boolean checkVerify = false;
		Map<String, String> map = new HashMap<>();
		Member checkMember = memberService.findByEmailAndPassword(loginEmail, AESUtil.encryptString(loginPassword));
		Member wrongPwdMember = memberService.findByEmail(loginEmail);
		
		if(checkMember != null && checkMember.isEnabled() == true) {
			
			request.getSession().setAttribute("memberid", checkMember.getMemberid());

		}else {
			if(wrongPwdMember == null) {
				id = "accountNotNull";
			}else if(wrongPwdMember != null && wrongPwdMember.isEnabled() == false) {
				id = "goemail";
			}else if(wrongPwdMember != null && wrongPwdMember.isEnabled() == true && wrongPwdMember.getOldpassword() == null) {
				id = "accountNotNull";
			}
			else {
				String memberOldPwd = wrongPwdMember.getOldpassword();
				String inputPwd = AESUtil.encryptString(loginPassword);
				if(memberOldPwd.equals(inputPwd)) {
					Date updateDate = wrongPwdMember.getUpdatepwddate();
					String dateToStr = updateDate.toInstant()
							.atOffset(ZoneOffset.UTC)
							.format( DateTimeFormatter.ofPattern("yyyy-MMM-dd"));
					map.put("date", dateToStr);
					id = "old";
				}else {
					id = "accountNotNull";
				}
			}
		}
		map.put("loginEmail", id);
		
		return map;
	}
	
	//點開驗證信的連結呼叫方法更改開通會員權限,並回傳至首頁
	@GetMapping("/verify")
	public String verifyAccount(@Param("code") String code, Model model) {
		boolean verified = memberService.verify(code);
		
		String pageTitle = verified ? "Verfication Suscceeded" : "Verfication Failed";
		model.addAttribute("pageTitle", pageTitle);
		
		return "Tip/" + (verified ? "verify_success" : "verify_fail");
	}
	
	//用於註冊時即時確認輸入的信箱是否已存在
	@PostMapping("/CheckEmailRepeat")
	public @ResponseBody Map<String, String> checkMemberId(@RequestParam(value = "email") String email) {
		String id = "";
		Map<String, String> map = new HashMap<>();
		
		if (email != null && email.trim().length() != 0) {
			Member checkMember = memberService.findByEmail(email);
			
			if(checkMember == null) {
				id = "";
			}else {
				id = "accountNotNull";
			}
			map.put("email", id);
		}
		return map;
	}
	
	//匯出資料庫圖片
	@GetMapping("/showPhoto/display/{memberid}")
	@ResponseBody
	public void showImage(@PathVariable("memberid") Integer memberid, HttpServletResponse response, Optional<Member> member) throws ServletException, IOException {
		member = memberService.adminFindById(memberid);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(member.get().getPhoto());
		response.getOutputStream().close();
	}

	//登出清除Session
	@GetMapping("/Logout")
	public String logout(HttpServletRequest request) {
		if(request.getSession().getAttribute("memberid")!=null) {
			request.getSession().invalidate();
		}
		return "index";
	}
}
