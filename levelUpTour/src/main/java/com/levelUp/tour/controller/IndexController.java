package com.levelUp.tour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/")
	public String index(Model model) {
		return "index";
	}
	//수정
	@RequestMapping("/")
	public String index2(Model model) {
		return "index";
	}

}
