package _00_util;

public class testUse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s = "D:\\Demo\\background\\b01.jpg";
		byte[] su = StreamUtils.readStream(s);
		Base64Utils.base64Encode(su);
//		for(byte b : su) {
//			System.out.println(b);
//		}
//		System.out.println(su);
//		System.out.println(Base64Utils.base64Encode(su));
//		 Base64Utils.base64Encode(su);
	}

}
