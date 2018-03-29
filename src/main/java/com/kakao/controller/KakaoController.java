package com.kakao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kakao")
public class KakaoController {
	@RequestMapping("/index")
	public String index(Model model) {
		return "KakaoList";
	}
}
