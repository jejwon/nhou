package com.nhou.controller.board;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("boardInsert")
	public void insert() {
		
	}
	
	@PostMapping("boardInsert")
	public String insert(BoardDto board, RedirectAttributes rttr,
			Principal principal) { // 작성한 작성자의 id정보를 가져와 닉네임을 알 수 있음
		
		String loginId = principal.getName();
		board.setMember_userId(loginId);
		
		int cnt = boardService.insert(board);
		
		if (cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다.");
		}
		
		return "redirect:/board/boardList";
	}
	
	// 게시글 리스트
	@GetMapping("boardList")
	public void get(@RequestParam(name="page", defaultValue = "1") int page, // 페이지
					@RequestParam(name="t", defaultValue = "all") String type, // 검색할 범위(카테고리)
					@RequestParam(name="q", defaultValue = "") String keyword, // 검색 키워드
					PageInfo pageInfo, Model model) {
		List<BoardDto> list = boardService.listBoard(page, type, keyword, pageInfo); // service에 listBoard로 넘어감
		
		model.addAttribute("boardList", list); // boardList라는 곳에 list를 담겠다
	}
	
	// 게시글 보기
	@GetMapping("boardGet")
	public void get(@RequestParam(name="boardId") int boardId,
			Model model) {
			
		BoardDto board = boardService.get(boardId);
		
		model.addAttribute("board", board);
		
	}
	
	// 게시글 수정하기(이전에 쓴 글 가져오기)
	@GetMapping("boardModify")
	public void modify(@RequestParam(name="boardId") int boardId,
			Model model) {
		
		BoardDto board = boardService.get(boardId); // service에 get을 사용
	
		model.addAttribute("board", board);
	}
	
	// 게시글 수정해서 다시 등록하기
	@PostMapping("boardModify")
	public String modify(BoardDto board, RedirectAttributes rttr) {
		int cnt = boardService.update(board); // service에 update를 사용

		if (cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 게시물이 수정되지 않았습니다.");
		}
		
		return "redirect:/board/boardList";
	}
	
	// 게시글 삭제하기
	@PostMapping("boardRemove")
	public String remove(@RequestParam(name="boardId") int boardId,
			RedirectAttributes rttr) {
		int cnt = boardService.remove(boardId);
		
		if (cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 삭제되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 게시물이 삭제되지 않았습니다.");
		}
		
		return "redirect:/board/boardList";
	}

}
