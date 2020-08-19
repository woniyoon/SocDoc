package com.synergy.socdoc.mail;

import javax.mail.*;

public class MySMTPAuthenticator2 extends Authenticator {
   
   @Override
   public PasswordAuthentication getPasswordAuthentication() {
      
      // Gmail인 경우 @gmail.com을 제외한 아이디만 입력한다.
      return new PasswordAuthentication("socdocsocdoc","qwer1234$");
   }
}