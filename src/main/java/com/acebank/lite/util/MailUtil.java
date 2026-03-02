package com.acebank.lite.util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.java.Log;

import java.util.Properties;
import java.util.concurrent.CompletableFuture;

@Log
public class MailUtil {

    public static void sendMailAsync(String recipient, String subject, String body) {
        CompletableFuture.runAsync(() -> {
            try {
                sendMail(recipient, subject, body);
            } catch (Exception e) {
                log.severe("[MailUtil-Async] Email thread failed: " + e.getMessage());
            }
        });
    }

    /**
     * Sends email via Gmail using SSL on port 465.
     * Returns true if sent successfully, false otherwise.
     */
    public static boolean sendMail(final String recipient, String subject, String body) {

        String fromAddr = ConfigLoader.getProperty(ConfigKeys.MAIL_ADDR);
        String appPwd   = ConfigLoader.getProperty(ConfigKeys.MAIL_PWD);

        log.info("[MailUtil] ====== EMAIL SEND ATTEMPT ======");
        log.info("[MailUtil] To      : " + recipient);
        log.info("[MailUtil] From    : " + fromAddr);
        log.info("[MailUtil] Pwd len : " + (appPwd != null ? appPwd.trim().length() : 0) + " chars");
        log.info("[MailUtil] Subject : " + subject);

        if (fromAddr == null || fromAddr.isBlank()) {
            log.severe("[MailUtil] ABORT: mail.default.address is missing in properties!");
            return false;
        }
        if (appPwd == null || appPwd.isBlank()) {
            log.severe("[MailUtil] ABORT: mail.google.app.password is missing in properties!");
            return false;
        }

        final String senderEmail = fromAddr.trim();
        // Google App Passwords are shown with spaces (e.g. "vgsw ahcy ruqh eees")
        // but must be sent WITHOUT spaces. Strip ALL whitespace, not just leading/trailing.
        final String password    = appPwd.replaceAll("\\s+", "");

        log.info("[MailUtil] Final cleaned password length: " + password.length() + " chars (expected 16)");
        log.info("[MailUtil] Sender email: " + senderEmail);

        // ── Try SSL on port 465 (more reliable than STARTTLS 587) ──
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host",        "smtp.gmail.com");
            props.put("mail.smtp.port",        "465");
            props.put("mail.smtp.auth",        "true");
            props.put("mail.smtp.socketFactory.port",   "465");
            props.put("mail.smtp.socketFactory.class",  "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");
            props.put("mail.smtp.connectiontimeout",    "15000");
            props.put("mail.smtp.timeout",              "15000");
            props.put("mail.smtp.writetimeout",         "15000");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, password);
                }
            });
            session.setDebug(true);  // ← TEMPORARY: shows full SMTP conversation in Tomcat logs

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail, "AceBank Support"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setContent(body, "text/plain; charset=UTF-8");

            Transport.send(message);
            log.info("[MailUtil] SUCCESS via SSL:465 – Email sent to: " + recipient);
            return true;

        } catch (AuthenticationFailedException authEx) {
            log.severe("[MailUtil] AUTH FAILED (SSL:465) – App password is wrong/expired!");
            log.severe("[MailUtil] Fix: Go to myaccount.google.com/apppasswords and regenerate.");
            log.severe("[MailUtil] Detail: " + authEx.getMessage());
            // Fall through to try STARTTLS:587
        } catch (Exception sslEx) {
            log.warning("[MailUtil] SSL:465 failed (" + sslEx.getClass().getSimpleName() + ": " + sslEx.getMessage() + ") — trying STARTTLS:587...");
        }

        // ── Fallback: Try STARTTLS on port 587 ──
        try {
            Properties props2 = new Properties();
            props2.put("mail.smtp.host",              "smtp.gmail.com");
            props2.put("mail.smtp.port",              "587");
            props2.put("mail.smtp.auth",              "true");
            props2.put("mail.smtp.starttls.enable",   "true");
            props2.put("mail.smtp.starttls.required", "true");
            props2.put("mail.smtp.ssl.trust",         "smtp.gmail.com");
            props2.put("mail.smtp.connectiontimeout", "15000");
            props2.put("mail.smtp.timeout",           "15000");
            props2.put("mail.smtp.writetimeout",      "15000");

            Session session2 = Session.getInstance(props2, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, password);
                }
            });
            session2.setDebug(false);

            Message message2 = new MimeMessage(session2);
            message2.setFrom(new InternetAddress(senderEmail, "AceBank Support"));
            message2.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message2.setSubject(subject);
            message2.setContent(body, "text/plain; charset=UTF-8");

            Transport.send(message2);
            log.info("[MailUtil] SUCCESS via STARTTLS:587 – Email sent to: " + recipient);
            return true;

        } catch (AuthenticationFailedException authEx2) {
            log.severe("[MailUtil] AUTH FAILED (STARTTLS:587) – App password rejected by Gmail.");
            log.severe("[MailUtil] ACTION REQUIRED: Regenerate App Password at myaccount.google.com/apppasswords");
            log.severe("[MailUtil] Current password length: " + password.length() + " | Account: " + senderEmail);
        } catch (Exception ex2) {
            log.severe("[MailUtil] STARTTLS:587 also failed: " + ex2.getClass().getSimpleName() + ": " + ex2.getMessage());
        }

        log.severe("[MailUtil] ====== ALL SEND ATTEMPTS FAILED for: " + recipient + " ======");
        return false;
    }
}