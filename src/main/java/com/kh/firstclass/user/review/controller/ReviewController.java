package com.kh.firstclass.user.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.firstclass.user.review.model.service.ReviewService;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("insertReview.rev")
	private String insertReview(ReviewPicture rp, Review r, @RequestParam("upfile[]") List<MultipartFile> file, HttpSession session) {
		
		// 사진 제외 리뷰 정보 넣기
		reviewService.insertReview(r);
		
		// 사진에 리뷰번호를 넘기기위해 select
		Review selectReview = reviewService.selectReview(r);
		
		// 여러 사진을 반복문을 통해 굳
		for(MultipartFile f : file) {
			System.out.println(f);
		    
			if(!f.getOriginalFilename().equals("")) {
				
				// 수정명 만들기
				String changeName = saveFile(f, session);
				
				// 담기
				rp.setOriginName(f.getOriginalFilename());      
				rp.setChangeName("resources/upfiles/review/" + changeName); 
				rp.setRevNo(selectReview.getRevNo());
				
				// 보내자
				// 사진 정보 DB에 넣기				
				reviewService.insertReviewPicture(rp);
				
			}
		}
		
		session.setAttribute("alertMsg", "게시글 작성 성공이용 ^~^");
		
		return "redirect:detailView.pl?placeNo="+r.getPlaceNo();
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일을 이름을 변경해서 서버에 업로드하는 역할밖에 하지않음
		
		// 파일 명 수정 작업 후 서버에 업로드 시키기("bono.png" => 202202211537401234.png")
		String originName = upfile.getOriginalFilename();
					
		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
					
		// 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
					
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
				
		String changeName = currentTime + ranNum + ext;
					
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/upfiles/review/");
				
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 리뷰정보(사진정보 x) 조회하기
	@ResponseBody
	@RequestMapping(value="selectReviewInformation.rev", produces="applictaion/json; charset=UTF-8")
	public String selectReviewInformation(int placeNo) {
		
		return new Gson().toJson(reviewService.selectReviewInformation(placeNo));
		
	}
	
	// 리뷰 사진 정보 조회하기
	@ResponseBody
	@RequestMapping(value="pictureReview.rev", produces="applictaion/json; charset=UTF-8")
	public String pictureReview(int placeNo) {
		
		return new Gson().toJson(reviewService.pictureReview(placeNo));
		
	}
	
}
