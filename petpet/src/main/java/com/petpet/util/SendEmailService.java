package com.petpet.util;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.petpet.model.Member;


@Component
public class SendEmailService {
	
	@Autowired
	public JavaMailSender mailSender;

	public void sendMail(Member member, String siteURL) throws Exception {

		String toAddress = member.getEmail();
	    String fromAddress = "fukinshinbrothers@outlook.com";
	    String senderName = "PetPet OnlineShop";
	    String subject = "啟用您在PetPet寵物網的帳號";
	    String verifyURL = siteURL + "/verify?code=" + member.getVerificationcode();
	    String content = "感謝您申辦PetPet寵物購物網的帳號!!,<br>"
	            + "請點選以下連結驗證您的帳號以完成會員的申辦:<br>"
	            + "<h3><a href=\"" + verifyURL + "\">VERIFY</a></h3>"
	            + "謝謝您!! 祝您有個美好的一天!!,<br>"
	            + "PetPet OnlineShop 團隊敬上";
		
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	    
	    helper.setCc(fromAddress);
		helper.setFrom(fromAddress, senderName);
		helper.setTo(toAddress);
		helper.setSubject(subject);
		helper.setText(content, true);
		
		mailSender.send(message);
		
	}
}
