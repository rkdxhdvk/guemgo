package com.guem.go.eunbyul;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;


import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class SimpleMailSender {
	private JavaMailSender mailSender;//메일전송기능의 객체
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public SimpleMailSender(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message=this.mailSender.createMimeMessage();
		messageHelper=new MimeMessageHelper(message,true,"utf-8");
		
		
	}
	
	public void setSubject(String subject) throws MessagingException{
		messageHelper.setSubject(subject);
	}
	public void setText(String htmlContent) throws MessagingException{
		messageHelper.setText(htmlContent,true);
	}
	public void setFrom(String email,String name) throws UnsupportedEncodingException,MessagingException{
		messageHelper.setFrom(email, name);
	}
	public void setTo(String email) throws MessagingException{
		messageHelper.setTo(email);
	}
	public void addInline(String contentId, DataSource dataSource) throws MessagingException{
		messageHelper.addInline(contentId, dataSource);
	}
	public void send() {
		mailSender.send(message);
	}
}


