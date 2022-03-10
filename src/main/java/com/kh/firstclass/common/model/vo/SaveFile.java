package com.kh.firstclass.common.model.vo;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

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
}
