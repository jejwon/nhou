package com.nhou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class Board {

	@GetMapping("boardList")
	public void boardList() {
		
	}
}
