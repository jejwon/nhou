package com.nhou.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhou.domain.board.BoardReplyDto;
import com.nhou.service.board.BoardReplyService;

@Controller
@RequestMapping("boardReply")
public class BoardReplyController {

	@Autowired
	private BoardReplyService boardReplyService;
	
	// 댓글 작성하기
	@PostMapping("add")
	@ResponseBody
	@PreAuthorize("isAuthenticated()") // 로그인 했을때만 작동하도록
	public Map<String, Object> add(@RequestBody BoardReplyDto reply,
			org.springframework.security.core.Authentication auth) { // 로그인한 정보 들어있음
		
		if (auth != null) {
			reply.setMember_userId(auth.getName());
		}
		
		Map<String, Object> map = new HashMap<>();
		
		int cnt = boardReplyService.addReply(reply); // service로
		
		if (cnt == 1) {
			map.put("message", "새 댓글 등록완료");
		} else {
			map.put("message", "새 댓글 등록실패");
		}
		
		return map;
	}
	
	// 댓글 리스트
	@GetMapping("list/{board_boardId}")
	@ResponseBody
	public List<BoardReplyDto> list(@PathVariable int board_boardId,
			org.springframework.security.core.Authentication auth) {
		
		String userName = "";
		
		// 로그인한 상태일때
		if (auth != null) {
			userName = auth.getName(); // 로그인한 아이디 얻어오기
		}
		return boardReplyService.listReplyByBoardId(board_boardId, userName);
	}
	
	// 댓글 삭제하기
	@DeleteMapping("delete/{boardReplyId}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable int boardReplyId) {
		Map<String, Object> map = new HashMap<>();

		int cnt = boardReplyService.deleteById(boardReplyId);
		
		
		if (cnt == 1) {
			map.put("message", "댓글 삭제완료");
		} else {
			map.put("message", "댓글 삭제실패");
		}
		
		return map;
	}
	
	// 댓글 불러오기
	@GetMapping("get/{boardReplyId}")
	@ResponseBody
	public BoardReplyDto get(@PathVariable int boardReplyId) {
		return boardReplyService.getById(boardReplyId);
	}
	
	// 댓글 수정하기
	@PutMapping("modify")
	public Map<String, Object> modify(@RequestBody BoardReplyDto reply) {
		Map<String, Object> map = new HashMap<>();
		
		int cnt = boardReplyService.modify(reply);
		
		if (cnt == 1) {
			map.put("message", "새 댓글 수정완료");
		} else {
			map.put("message", "새 댓글 수정실패");
		}
		
		return map;
	}
}