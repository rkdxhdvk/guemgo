package com.guem.go.eunbyul;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SimpleMailSender {
	private MailSender mailSender;//메일전송기능의 객체
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	public boolean sendMail(String title,String msg,String toEmail,String fromEmail) {
		try {
			//보낼메일에 대한 정보 설정객체
			SimpleMailMessage mailMsg=new SimpleMailMessage();
			mailMsg.setSubject(title);//제목
			mailMsg.setText(msg);//내용
			mailMsg.setTo(toEmail);//받는이
			mailMsg.setFrom(fromEmail);//보내는이
			mailSender.send(mailMsg);//메일보내기
			return true;
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
}


