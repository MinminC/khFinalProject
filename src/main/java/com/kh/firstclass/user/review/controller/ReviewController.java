package com.kh.firstclass.user.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Inquiry;
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
	
	// 나의 리뷰정보(사진정보 x) 조회하기
	@ResponseBody
	@RequestMapping(value="mySelectReviewInformation.rev", produces="applictaion/json; charset=UTF-8")
	public String mySelectReviewInformation(int userNo) {
		
		return new Gson().toJson(reviewService.mySelectReviewInformation(userNo));
		
	}
	
	// 리뷰 사진 정보 조회하기
	@ResponseBody
	@RequestMapping(value="pictureReview.rev", produces="applictaion/json; charset=UTF-8")
	public String pictureReview(int placeNo) {
		
		return new Gson().toJson(reviewService.pictureReview(placeNo));
		
	}
	
	// 
	// 나의 리뷰 사진 정보 조회하기
		@ResponseBody
		@RequestMapping(value="myPictureReview.rev", produces="applictaion/json; charset=UTF-8")
		public String myPictureReview(int userNo) {
			
			return new Gson().toJson(reviewService.myPictureReview(userNo));
			
		}
	
	//deleteReview.rev
	// 리뷰 삭제
	@ResponseBody
	@RequestMapping(value="deleteReview.rev", produces="applictaion/json; charset=UTF-8")
	public String deleteReview(int revNo, HttpSession session) {
		
		// 리뷰번호로 changeName 가져와서 파일 삭제
		ArrayList<ReviewPicture> list = reviewService.selectChangeName(revNo);
		
		// 가져온 changeName으로 삭제
		for(ReviewPicture rp : list) {
			new File(session.getServletContext().getRealPath(rp.getChangeName())).delete();
		}
				
		// 리뷰사진 삭제
		int result = reviewService.deleteReviewPicture(revNo);
		// 리뷰 삭제
		result *= reviewService.deleteReview(revNo);
		return new Gson().toJson(result);
	}
	
	// review.ad
	// 리뷰관리(관리자)
	@RequestMapping("review.ad")
	public ModelAndView reviewManagement(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		int listCount = reviewService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = PageInfo.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
		ArrayList<Review> list = reviewService.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi", pi);
		
		mv.setViewName("admin/review/reviewManagement");
		
		return mv;
		
	}
	 
	// 리뷰 상세 보기(관리자)
	@RequestMapping("reviewDetail.ad")
	public ModelAndView reviewDetail(int no, ModelAndView mv) {
		
		Review r = reviewService.reviewDetail(no);
		
		// 사진 가져오기
		ArrayList<ReviewPicture> rp = reviewService.reviewPictureDetail(no);
		mv.addObject("r",r).addObject("rp",rp).setViewName("admin/review/reviewDetail");
				
		return mv;
		
	}	
	  
	
	
	
	
	
	
	
	
	
	
	
	
	
}
