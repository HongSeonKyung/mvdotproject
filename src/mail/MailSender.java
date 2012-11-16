package mail;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	private Session session;

	public MailSender() {
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.auth", "true");
		Authenticator auth = new SMTPAuthenticator();
		session = Session.getDefaultInstance(props, auth);

	}

	public boolean sendMail(String email, String name, String password) {
		try {
			MimeMessage message = new MimeMessage(session);
			InternetAddress from = new InternetAddress("noreply@mvdot.com", "영화마침표");
			message.setFrom(from);

			InternetAddress to = new InternetAddress(email, name);
			InternetAddress[] toList = { to };

			message.setRecipients(Message.RecipientType.TO, toList);
			message.setSubject("[mvdot] 비밀번호 안내");
			String content = "<html>";
			content += "<body>";
			content += "<p>" + name + " 님의 비밀번호를 안내해드립니다.</p>";
			content += "<p>비밀번호:" + password + "</p>";

			content += "</body>";
			content += "</html>";
			message.setContent(content, "text/html; charset=UTF-8");

			Transport.send(message);
			return true;
		} catch (MessagingException | UnsupportedEncodingException e) {
			return false;
		}
	}
}
