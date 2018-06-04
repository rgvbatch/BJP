package com.java.servlet;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.userbean.Userbean;

public class Email1 {

	/**
	   Outgoing Mail (SMTP) Server
	   requires TLS or SSL: smtp.gmail.com (use authentication)
	   Use Authentication: Yes
	   Port for TLS/STARTTLS: 587
	 */

	public static void mail(Userbean user) throws ClassNotFoundException {
		
		
		final String fromEmail = "rgvbatch@gmail.com"; //requires valid gmail id
		final String password = "rgv@4699"; // correct password for gmail id
		final String toEmail = user.getEmail(); // can be any email id 
		
		System.out.println("TLSEmail Start");
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.debug", "true"); 
		props.put("mail.smtp.port", "465"); //TLS Port
		props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
		props.put("mail.smtp.auth", "true"); //enable authentication
		props.put("mail.smtp.starttls.required", "true"); //enable STARTTLS
		props.put("mail.smtp.EnableSSL.enable","true");

		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		props.setProperty("mail.smtp.socketFactory.fallbac k", "false"); 
		props.setProperty("mail.smtp.port", "465"); 
		props.setProperty("mail.smtp.socketFactory.port", "465"); 
		
                //create Authenticator object to pass in Session.getInstance argument
		Authenticator auth = new Authenticator() {
			//override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);
		
		String subject=user.getConstitution();
		
		
		String body= "your username is ::"+user.getUsername()+"  , "+"password is::::"+user.getPassword();
	
		
		
		Email.sendEmail(session, toEmail,subject, body);
		
		
	

	}

	
}