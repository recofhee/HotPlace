package com.HotPlace.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	public static void main(String[] args) {
		System.out.println(new SHA256().testSHA256("1"));
	}
	// 들어오는 값을 바이트 단위로 해시 값을 만들어준다.
	public String testSHA256(String str) {

		String SHA = "";

		try {

			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(str.getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {

				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));

			}

			SHA = sb.toString();

		} catch (NoSuchAlgorithmException e) {

			e.printStackTrace();

			SHA = null;

		}

		return SHA;

	}

}
