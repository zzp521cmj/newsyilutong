package com.jy.common;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

public class SocketUtils {
	public static void main(String[] args) {}
		/*String ip = "192.168.5.51";
		int port = 9123;
		try {
		Socket socket = new Socket(ip, port);
		socket.setSoTimeout(5539900);
		OutputStream out = socket.getOutputStream();

		byte[] date = "hello world".getBytes();
		out.write(date);
		out.flush();
		byte[] buffer = new byte[1024];
		int len = -1;
		FileOutputStream fout = new FileOutputStream("d:/response.txt");
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		InputStream in = socket.getInputStream();
		while ((len = in.read(buffer, 0, buffer.length)) > 0) {
		bout.write(buffer, 0, len);
		}
		in.close();
		bout.flush();
		bout.close();

		byte[] rdata = bout.toByteArray();
		System.out.println(new String(rdata));

		fout.write(rdata);
		fout.flush();
		fout.close();
		socket.close(); 
		} catch (UnknownHostException e1) {
		e1.printStackTrace();
		} catch (IOException e) {
		e.printStackTrace();
		}
		}*/
	}

