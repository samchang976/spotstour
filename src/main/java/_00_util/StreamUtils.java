package _00_util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class StreamUtils {

	public static byte[] readStream(String filePath) {
		long s = 0, e = 0;
		File inFile = new File(filePath);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try (FileInputStream fis = new FileInputStream(inFile);
				BufferedInputStream bis = new BufferedInputStream(fis);) {
			// 開始紀錄資料讀入時間
			s = System.currentTimeMillis();
			int count = 0;
			byte[] ba = new byte[1024];
			while ((count = bis.read()) != -1) {
				baos.write(ba, 0, count);
				System.out.println(baos.size());
			}
			e = System.currentTimeMillis();
			System.out.println("時間差(每次讀/寫 位元組) = " + (e - s));
			fis.close();
			bis.close();
			baos.close();
		} catch (IOException ex) {
			System.out.println("資料讀取異常 : " + ex.getMessage());
		}

		return baos.toByteArray();
	}

	public static String writeStream(byte[] fileByte, String filePath, String fileName) throws IOException {
		if (fileByte == null) {
			return null;
		}
		String path = filePath + fileName;
		//建立資料夾,判斷資料夾存在
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		//建立檔案,判斷檔案存在
		file = new File(path);
		if (!file.exists()) {
			file.createNewFile();
		}
		OutputStream output = new FileOutputStream(file);
		BufferedOutputStream bufferedOutput = new BufferedOutputStream(output);
		bufferedOutput.write(fileByte);
		bufferedOutput.flush();
		bufferedOutput.close();

		path.substring(51);
		
		return path;
	}
}
