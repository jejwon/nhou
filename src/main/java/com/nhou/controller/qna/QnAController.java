package com.nhou.controller.qna;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhou.domain.member.MemberDto;
import com.nhou.domain.qna.PageInfo;
import com.nhou.domain.qna.QnADto;
import com.nhou.service.member.MemberService;
import com.nhou.service.qna.QnAService;

@Controller
@RequestMapping("qnaBoard")
public class QnAController {
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private MemberService memberService;

	
	@GetMapping("qnaInsert")
	public void insert(){
		
	}
	//문의 작성
	@PostMapping("qnaInsert")
	public String insert(Principal principal, QnADto qna) {
		String loginId = principal.getName();
		qna.setMember_userId(loginId);
		qnaService.insert(qna);
		
		return "redirect:/qnaBoard/qnaList";
	}
	
	//문의 리스트
	@GetMapping("qnaList")
	public void list(@RequestParam(name="page", defaultValue="1") int page,//페이지
					PageInfo pageInfo,Model model){
		List<QnADto> list = qnaService.list(page, pageInfo);
		
		model.addAttribute("qnaList", list);
	}
	
	//문의 보기 페이지
	@GetMapping("qnaGet")
	public void get(@RequestParam(name="qnaId") int qnaId, Model model, Principal principal, MemberDto member) {
		String loginId = principal.getName();
		QnADto qna = qnaService.getByQnAId(qnaId);
		
		member.setUserId(loginId);
		
		model.addAttribute("member", member);
		model.addAttribute("qna", qna);
		
	}
	
	//문의 삭제
	@PreAuthorize("@qnABoardSecurity.checkWriter(authentication.name, #qnaId)")
	@PostMapping("delete")
	public String remove(int qnaId) {
		qnaService.delete(qnaId);
		
		return "redirect:/main/list";
	}

	
	
}
