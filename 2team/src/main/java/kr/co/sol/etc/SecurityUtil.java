package kr.co.sol.etc;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {
	public String encryptSHA256(String str) {	
	String newPass = "";
	try {
		MessageDigest sh = MessageDigest.getInstance("SHA-256");
		sh.update(str.getBytes());
		byte byteData[] = sh.digest();
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < byteData.length;i++){
			sb.append(Integer.toString((byteData[i]&0xff)+0x100,16).substring(1));
		}
		newPass = sb.toString();
	} catch (NoSuchAlgorithmException e) {
		newPass = null;
	}	
	return newPass;
}

}