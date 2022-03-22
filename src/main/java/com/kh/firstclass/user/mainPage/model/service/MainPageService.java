package com.kh.firstclass.user.mainPage.model.service;

import java.util.ArrayList;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.user.notice.model.vo.Notice;

public interface MainPageService {

	ArrayList<Notice> selectFixedNotice();

	ArrayList<Place> selectBestPlace();

}
