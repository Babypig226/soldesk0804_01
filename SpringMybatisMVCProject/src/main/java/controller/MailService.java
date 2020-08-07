package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(String receiver, String userId) throws Exception{
		MimeMessage msg = mailSender.createMimeMessage();
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMddHHmmss");
		String num = dateForm.format(new Date());
		String content = "<html><body>"
				       + "안녕하세요 '" + userId +"'님 가입을 환영합니다.<br />"
				       + "아래 링크를 눌러야 가입이 완료가 됩니다. <br />"
				       + "<a href='http://172.16.3.10:8080/SpringMybatisMVCProject/register/"
				       + "memberMail?num="+num+"&receiver="+receiver+"&userId="+userId+"'>"
				       + "<strong><b>"
				       + "가입을 완료하시려면 여기를 눌러주세요.</a>"
				       + "</b></strong>"
					   + "</body></html>";
		String subject = "가입환영인사";
			msg.setHeader("content-type", "text/html; charset=UTF-8");
			msg.setContent(content, "text/html; charset=UTF-8");
			msg.setSubject(subject);
			msg.setRecipient(MimeMessage.RecipientType.TO , new InternetAddress(receiver));
			mailSender.send(msg);
	}
}