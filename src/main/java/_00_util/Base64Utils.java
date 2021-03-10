package _00_util;

import java.util.Base64;

public class Base64Utils {

	// 編譯成Base64編碼
	public static String base64Encode(byte[] fileBytes) {
		if(fileBytes == null) {
			return null;
		}
		return Base64.getEncoder().encodeToString(fileBytes);
	}

	
//	public static byte[] base64Dncode(byte[] fileBytes) {
//		byte[] decodedBytes = Base64.getDecoder().decode(fileBytes);
//		return decodedBytes;
//	}

}
