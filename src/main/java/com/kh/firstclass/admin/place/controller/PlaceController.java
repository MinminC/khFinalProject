package com.kh.firstclass.admin.place.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {
	@RequestMapping("list.pl")
	public String selectPlaceList() {
		return "admin/place/placeListView";
	}
	
	@RequestMapping("detail.pl")
	public String selectPlaceDetail(){
		return "admin/place/placeDetailView";
	}

	@RequestMapping("updateForm.pl")
	public String updatePlaceForm(int pno, Model model){
		model.addAttribute("pno", pno);
		return "admin/place/placeUpdateForm";
	}

	@RequestMapping("update.pl")
	public String updatePlace(){
		return "";
	}

	@RequestMapping("insertForm.pl")
	public String enrollPlaceForm() {
		return "admin/place/placeInsertForm";
	}
	
	@RequestMapping("insert.pl")
	public String insertPlace() {
		return "";
	}
}
