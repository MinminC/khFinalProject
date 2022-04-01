package com.kh.firstclass.admin.place.model.vo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HttpDownloadUtility {
    private static final int BUFFER_SIZE = 4096;
 
    /**
     * URL 주소로 사진 저장하는 방법
     * @param fileURL HTTP URL of the file to be downloaded
     * @param saveDir path of the directory to save the file
     * @throws IOException
     */
    public static String downloadFile(String fileURL, String saveDir)
            throws IOException {
        URL url = new URL(fileURL);
        HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
        int responseCode = httpConn.getResponseCode();
        String fileName = "";
 
        // responseCode를 항상 제일 먼저 체크해야함->제대로된 응답을 받았을 경우만 해당 내용 체크
        if (responseCode == HttpURLConnection.HTTP_OK) {
            String disposition = httpConn.getHeaderField("Content-Disposition");
            String contentType = httpConn.getContentType();
            int contentLength = httpConn.getContentLength();
 
            if (disposition != null) { //헤더 영역에 컨텐츠의 내용이 저장되어 있는 경우
                int index = disposition.indexOf("filename=");
                if (index > 0) {//filename으로 검색한 내용에서 추출
                    fileName = disposition.substring(index + 10, disposition.length() - 1);
                }
            } else {//저장 안된 경우 새로운 파일명 생성
        		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());//시간
        		int ranNum = (int)(Math.random()*90000+10000);//랜덤 5자리
        		String ext = fileURL.substring(fileURL.lastIndexOf("."));//확장자
        		fileName = currentTime + ranNum + ext;//파일명 수정 작업
            }
            // HttpConnection으로 InputStream을 열기
            InputStream inputStream = httpConn.getInputStream();
            //파일 경로 저장
            String saveFilePath = saveDir + File.separator + fileName;
            // saveFilePath 경로로 파일을 저장하는 스트림열기
            FileOutputStream outputStream = new FileOutputStream(saveFilePath);
 
            int bytesRead = -1;
            byte[] buffer = new byte[BUFFER_SIZE];
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
 
            outputStream.close();
            inputStream.close();
        } else {
            System.out.println("파일이 저장되지 않았음. Server replied HTTP code: " + responseCode);
        }
        httpConn.disconnect();
        
        return fileName;
    }
}