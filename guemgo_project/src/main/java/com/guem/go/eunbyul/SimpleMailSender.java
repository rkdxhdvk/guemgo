package com.guem.go.eunbyul;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SimpleMailSender {
	private MailSender mailSender;//�������۱���� ��ü
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	public boolean sendMail(String title,String msg,String toEmail,String fromEmail) {
		try {
			//�������Ͽ� ���� ���� ������ü
			SimpleMailMessage mailMsg=new SimpleMailMessage();
			mailMsg.setSubject(title);//����
			mailMsg.setText(msg);//����
			mailMsg.setTo(toEmail);//�޴���
			mailMsg.setFrom(fromEmail);//��������
			mailSender.send(mailMsg);//���Ϻ�����
			return true;
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
}


