package security.controller;
import java.util.Base64;

import org.springframework.stereotype.Component;

@Component
public class Base64Example {
    
        //encode
        public String encode(String originalPassword) {
        String encodedPassword = Base64.getEncoder().encodeToString(originalPassword.getBytes());
        return encodedPassword;
        
        }
        
        // Decoding
        public String decode(String encodedPassword) {
        byte[] decodedBytes = Base64.getDecoder().decode(encodedPassword);
        String decodedPassword = new String(decodedBytes);
        return  decodedPassword;
        
    }
}
