package com.evolve.util;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

//메일 인증
	public class MailSendThread extends Thread {

		private JavaMailSender mailSender;
		private String mailAddress;

		public MailSendThread(JavaMailSender mailSender, String mailAddress) {
			super();
			this.mailSender = mailSender;
			this.mailAddress = mailAddress;
		}
		
		
		public String mailSend() {
			// 메일 api활용
			MimeMessage message = null;
			MimeMessageHelper messageHelper = null;
			message = mailSender.createMimeMessage();
			CreateKey createKey = new CreateKey();
			try {
				String authKey = createKey.getCreateKey();
				messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setSubject("[L.A.S] 이메일 인증을 위한 메일입니다.");
				String text = "";
				text+= "<div style='margin:100px;'>";
		        text+= "<h1> 안녕하세요 L.A.S 입니다. </h1>";
		        text+= "<br>";
		        text+= "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
		        text+= "<br>";
		        text+= "<p>감사합니다!<p>";
		        text+= "<br>";
		        text+= "<div align='center' style='border:2px solid black; font-family:verdana';>";
		        text+= "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";
		        text+= "<div style='font-size:130%'>";
		        text+= "CODE : <strong>";
		        text+= authKey+"</strong><div><br/> ";
		        text+= "</div>";

				messageHelper.setText(text, true);
				messageHelper.setFrom("admin", "L.A.S");
				messageHelper.setTo(mailAddress);
				mailSender.send(message);
				System.out.println("메일 전송 완료");
				
				return authKey;
			} catch (MessagingException e) {
				e.printStackTrace();
				return e.toString();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return e.toString();
			}
		}
	}