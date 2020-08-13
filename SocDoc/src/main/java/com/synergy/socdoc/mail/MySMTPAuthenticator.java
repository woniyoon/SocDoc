package com.synergy.socdoc.mail;

import javax.mail.*;

public class MySMTPAuthenticator extends Authenticator {
   
   @Override
   public PasswordAuthentication getPasswordAuthentication() {
      
      // Gmail인 경우 @gmail.com을 제외한 아이디만 입력한다.
      return new PasswordAuthentication("yahoho9090","Qwer1234!");
   }
}