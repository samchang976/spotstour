package _00_util;

import java.util.Base64;

public class Base64Utils {

	// 編譯成Base64編碼
	public static byte[] base64Encode(byte[] fileBytes) {
		byte[] encodedBytes = Base64.getEncoder().encode(fileBytes);
		System.out.println("編碼完成 " + encodedBytes.length);
		return encodedBytes;
	}

	public static byte[] base64Dncode(byte[] fileBytes) {
		byte[] decodedBytes = Base64.getDecoder().decode(fileBytes);
		System.out.println("解碼完成");
		return decodedBytes;
	}

}
