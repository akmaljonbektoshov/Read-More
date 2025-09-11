package uz.pdp.read_more.service;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class MailService {
    private static final String FROM_EMAIL = "sultanovoybek01@gmail.com";
    private static final String APP_PASSWORD = "dkswzuwomygewcbu"; // Gmail app password

    public static void sendCode(String to, Integer password) {
        String subject = "Welcome to our library system!";
        String messageText = "Your password is " + password;

        try {
            sendEmail(to, subject, messageText);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void sendEmail(String toEmail, String subject, String messageText) throws MessagingException {
        // SMTP settings for Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(FROM_EMAIL));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject);
        message.setText(messageText);

        Transport.send(message);
    }
}
