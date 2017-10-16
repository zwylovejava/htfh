package com.boot.tool;

import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5HashPassword {
	public static String getPassword(String userName, String password) {
		Md5Hash hash = new Md5Hash(password, userName, 3);
		return hash.toString();
	}
}
