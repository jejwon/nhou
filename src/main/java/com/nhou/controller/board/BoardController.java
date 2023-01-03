package com.nhou.controller.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.board.PageInfo;
import com.nhou.service.board.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private BoardService boardService;

	/*
	 * @GetMapping("boardList") public void boardList(
	 * 
	 * @RequestParam(name="page", defaultValue = "1") int page,
	 * 
	 * @RequestParam(name="t", defaultValue = "all") String type,
	 * 
	 * @RequestParam(name="q", defaultValue = "") String keyword,
	 * 
	 * @RequestParam(name="category", defaultValue = "") String category, BoardDto
	 * board, Model model, PageInfo pageInfo) { // 게시글 목록 List<BoardDto> list =
	 * boardService.listBoard(page, type, keyword, category, pageInfo);
	 * model.addAttribute("boardList", list); }
	 */
	
	@GetMapping("boardInsert")
	public void insert() {
		
	}
	
	@PostMapping("boardInsert")
	public String insert(BoardDto board, RedirectAttributes rttr) {
		
		boardService.insert(board);
		
		return "redirect:/board/boardList";
	}
}
