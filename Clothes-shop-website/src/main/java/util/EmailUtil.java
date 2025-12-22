package util;

import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.Session;
import jakarta.mail.internet.*;

public class EmailUtil {
	public static void sendResetPasswordEmail(String toEmail, String resetLink) {
		final String fromEmail = "nguyenlinhpd1@gmail.com";
		final String appPassword = "dblomfawwuowpown";
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, appPassword);
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Reset mật khẩu");
			message.setText("Bạn đã yêu cầu đặt lại mật khẩu.\n\n" + "Click vào link sau:\n" + resetLink + "\n\n"
					+ "Link hết hạn sau 15 phút.");
			Transport.send(message);
			System.out.println("✅ Gửi mail thành công!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
