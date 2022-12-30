package com.nhou.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.domain.board.BoardDto;

@Controller
@RequestMapping("board")
public class Board {

	@GetMapping("boardList")
	public void boardList() {
		
	}
	
	@GetMapping("boardInsert")
	public void insert() {
		
	}
	
	@PostMapping("boardInsert")
	public String insert(BoardDto baord) {
		return "redirect:/board/boardList";
	}
}
