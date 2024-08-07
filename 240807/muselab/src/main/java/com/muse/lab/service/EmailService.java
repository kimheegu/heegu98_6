package com.muse.lab.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service("emailService")
@RequiredArgsConstructor
public class EmailService {
	
	private final JavaMailSender emailSender; // 의존성 주입을 통해 필요한 객체를 가져옴
	private static final String senderEmail= "tyu315@naver.com";
	private static int randomCode; // 랜덤 인증 코드
	
	// 인증 코드 생성
	public static void createCode(){
		randomCode = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
	}
	
	// 메일 양식
	public MimeMessage createMail(String mail){
		createCode();
		MimeMessage message = emailSender.createMimeMessage();
		
		try {
			message.setFrom(senderEmail);
			message.setRecipients(MimeMessage.RecipientType.TO, mail);
			message.setSubject("[MuseLab] 회원가입을 위한 이메일 본인 인증");
			String body = "";
			body += "<h3>" + "회원가입을 위해 요청하신 인증 번호입니다." + "</h3>";
			body += "<div align='center' style='border:1px solid black; font-family:verdana;'>";
			body += "<h1 style=\"color:#fe06c9;\">" + randomCode + "</h1>";
			body += "</div><br>";
			body += "<h3>" + "회원가입 페이지로 돌아가서 코드를 작성해 주시길 바랍니다." + "</h3>";
			message.setText(body,"UTF-8", "html");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	// 실제 메일 전송
	public int sendEmail(String email) {
		// 메일 전송에 필요한 정보 설정
		MimeMessage message = createMail(email);
		// 실제 메일 전송
		emailSender.send(message);
		
		// 인증 코드 반환
		return randomCode;
	}

}
