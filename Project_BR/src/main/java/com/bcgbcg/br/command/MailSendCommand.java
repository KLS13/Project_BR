package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

public class MailSendCommand implements MailCommand {
	
	@Override
	public void execute(Model model) {

		int authKey = 0;
		
		try {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			String email = request.getParameter("email");
			
			JavaMailSender mailSender = (JavaMailSender) map.get("mailSender"); // mailSender 가 메일을 보냄
			
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom("lond_no_care@naver.com"); // 보내는 사람 메일 주소
			message.setTo(email); // 받는 사람 메일 주소
			message.setSubject("인증메일입니다."); // 메일 제목
			authKey = (int)(Math.random() * 10000000) + 1234567; // 랜덤으로 인증키 값 생성(다른 방법을 사용해도 무방하다.)
			message.setText(
					"다음 인증번호를 입력하세요 : " + authKey); // 메일 내용
			mailSender.send(message); // 메일 보내기 (try-catch 문이 필요함)
		} catch (MailException e) {
			System.out.println(e.getMessage());
		}
		
		model.addAttribute("authKey", authKey); // 인증키를 다음 뷰에 전달하여 인증키가 맞는지 확인하기 위함
		
	}

}
