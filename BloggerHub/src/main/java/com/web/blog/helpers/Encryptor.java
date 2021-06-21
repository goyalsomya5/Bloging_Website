package com.web.blog.helpers;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Encryptor {
	public static String Hash(String password) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("SHA256");
		
		md.update(password.getBytes());
		
		byte[] digest = md.digest();
		
		StringBuilder sb = new StringBuilder();
		
		for (byte b : digest)
			sb.append(String.format("%02x", b & 0xff));

		return sb.toString();
	}
}
