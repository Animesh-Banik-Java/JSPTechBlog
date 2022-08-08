package com.jsp.techblog.healper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream; 

public class Helper {


	public static boolean deleteOldFile(String path) {
		boolean f = false;
		try {
			File file = new File(path);
			f = file.delete();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	

	public static boolean saveImage(InputStream is, String path) {
		boolean f = false;
		try {
			byte b[] = new byte[is.available()];
			is.read(b);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			f = true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return f;
	}
}
