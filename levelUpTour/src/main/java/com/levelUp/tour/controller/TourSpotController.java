package com.levelUp.tour.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TourSpotController {

	// 01. 관광지 정보 페이지로 이동
	@RequestMapping(value="/tourSpot", method=RequestMethod.GET)
	public ModelAndView tourSpot() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tourSpot");
		return mv;
	}
}
