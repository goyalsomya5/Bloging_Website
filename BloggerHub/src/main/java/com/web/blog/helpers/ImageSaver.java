package com.web.blog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ImageSaver {
	public static boolean savefile(InputStream is, String path) throws IOException {
		boolean f = false;
		try {
			byte data[] = new byte[is.available()];

			is.read(data);

			FileOutputStream fos = new FileOutputStream(path);

			fos.write(data);
			fos.flush();
			fos.close();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;

	}

	public static  boolean deletefile(String path) {
		boolean f = false;
		try {
			File file = new File(path);
			f = file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
