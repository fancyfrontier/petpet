package com.petpet.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.assertj.core.internal.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petpet.model.Member;
import com.petpet.service.MemberNotFoundException;
import com.petpet.service.MemberService;
import com.petpet.util.Utility;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	public JavaMailSender mailSender;
	
	//導向忘記密碼頁面
	@GetMapping("/ForgotPassWord")
	public String showForgotPasswordForm(Model model) {
		return "MemberForgotPwd";
	}
	
	//輸入信箱點選送出時觸發,產生亂數驗證碼並呼叫方法送出變更密碼的驗證信
	@PostMapping("/ForgotPassWordSend")
	public String processForgotPasswordForm(@RequestParam(name = "email") String email,
											HttpServletRequest request,
											Model model) {
		
		String token = RandomString.make(45);
		try {
			memberservice.updateResetPasswordToken(token, email);
			
			String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;

			sendEmail(email, resetPasswordLink);
			
			return "Tip/MemberCheckForgotMailTip";
		} catch (MemberNotFoundException ex) {
			model.addAttribute("error", ex.getMessage());
			return "MemberForgotPwd";
		} catch (UnsupportedEncodingException | MessagingException e) {
			model.addAttribute("error", "寄件錯誤");
			return "MemberForgotPwd";
		}
	}
	
	//使用者點開密碼重置信連結觸發,驗證亂數碼並轉至重設密碼頁面
	@GetMapping("/reset_password")
	public String showResetPasswordForm(@Param(value = "token") String token,
										Model model) {
		model.addAttribute("token", token);
		return "MemberResetPwd";
	}
	
	//於密碼重設頁面透過亂數碼特定用戶再更新密碼,並轉至成功修改密碼頁面
	@PostMapping("/ResetPassword")
	public String processResetPassword(HttpServletRequest request, Model model) {
		String token = request.getParameter("token");
		String password = request.getParameter("password");
		
		Member member = memberservice.get(token);
		memberservice.updateResetPassword(member, password);
		return "Tip/MemberSuccessResetPwdTip";
	}
	
	
	private void sendEmail(String email, String resetPasswordLink) throws MessagingException, UnsupportedEncodingException {
		
	    String fromAddress = "fukinshinbrothers@outlook.com";
	    String senderName = "PetPet OnlineShop";
	    String subject = "PetPet OnlineShop 密碼重置驗證信";
	    String content = "親愛的用戶您好:<br>"
	            + "本郵件為遺失密碼的重置驗證信，請透過點選以下連結進行密碼的設定。<br>"
	            + "<h3><a href=\"" + resetPasswordLink + "\">Check My Password</a></h3>"
	            + "謝謝您!! 祝您有個美好的一天!!,<br>"
	            + "PetPet OnlineShop 團隊敬上";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setCc(fromAddress);
		helper.setFrom(fromAddress, senderName);
		helper.setTo(email);
		helper.setSubject(subject);
		helper.setText(content, true);
		mailSender.send(message);
	}
	
}
