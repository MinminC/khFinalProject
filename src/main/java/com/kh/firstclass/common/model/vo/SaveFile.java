package com.kh.firstclass.common.model.vo;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.kh.firstclass.admin.place.model.vo.HttpDownloadUtility;

public class SaveFile {
	
	/**
	 * @param folder 파일을 저장할 upfiles 하위 폴더
	 * @param upFile
	 * @param session
	 * @return
	 */
	public static String changeName(String folder, MultipartFile upFile, HttpSession session) {
		String originName = upFile.getOriginalFilename();
		
		//시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//랜덤 5자리
		int ranNum = (int)(Math.random()*90000+10000);
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//파일명 수정 작업 후 서버에 업로드
		String changeName = currentTime + ranNum + ext;
		
		//업로드할 폴더의 물리적인 경로
		String savePath = session.getServletContext().getRealPath("/resources/upfiles/"+folder+"/");
		
		try {
			upFile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	/**
	 * 사진 주소를 받아서 서버에 저장하는 메소드
	 * @param folder
	 * @param imgPath
	 * @param session
	 * @throws IOException 
	 */
	public static String changeImgName(String folder, String imgPath, HttpSession session) throws IOException {
		String savePath = session.getServletContext().getRealPath("/resources/upfiles/"+folder+"/");
		return HttpDownloadUtility.downloadFile(imgPath, savePath);
	}
}
