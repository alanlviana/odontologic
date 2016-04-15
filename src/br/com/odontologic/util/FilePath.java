package br.com.odontologic.util;

public class FilePath {
	public static String uploadPath(){
		String path = System.getProperty("java.io.tmpdir")+"uploads\\";
		return path;
	}
	
}
