/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Kevin
 */
public class javaGmail {
    
      public static void send(String to, String subject, String msg){
       final String username = "domilavservicio@gmail.com" ;
       final String password = "kevincarolinagabriela";
       
       Properties props = new Properties();
       
       props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.starttls.enable", "true");
       props.put("mail.smtp.host", "smtp.gmail.com");
       props.put("mail.smtp.port", "587");
       
        Session session = Session.getInstance(props, new javax.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(msg);
            
            Transport.send(message);
            
        } catch(MessagingException me){
            sendSSLPort(to, subject, msg);
        } catch(Exception e){
            throw new RuntimeException(e);
        }
    }
    
    public static void sendSSLPort(String to, String subject, String msg){
       final String username = "domilavservicio@gmail.com" ;
       final String password = "kevincarolinagabriela";
       
       Properties props = new Properties();
       
       props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.starttls.enable", "true");
       props.put("mail.smtp.host", "smtp.gmail.com");
       props.put("mail.smtp.port", "465");
       
        Session session = Session.getInstance(props, new javax.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(msg);
            
            Transport.send(message);
            
        } catch(MessagingException me){
            throw new RuntimeException(me);
        } catch(Exception e){
            throw new RuntimeException(e);
        }
    }
    
    
}
