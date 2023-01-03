package com.nhou.controller.qna;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhou.domain.member.MemberDto;
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
	
	@PostMapping("qnaInsert")
	public String insert(Principal principal, QnADto qna) {
		String loginId = principal.getName();
		qna.setMember_userId(loginId);
		qnaService.insert(qna);
		
		return "redirect:/qnaBoard/qnaList";
	}
	
	@GetMapping("qnaList")
	public void list(Model model){
		List<QnADto> list = qnaService.list();
		
		model.addAttribute("qnaList", list);
	}
	
	@GetMapping("qnaGet")
	public void get(@RequestParam(name="qnaId") int qnaId, Model model, Principal principal) {
		//String loginId = principal.getName();
		QnADto qna = qnaService.getByQnAId(qnaId);
		
		//qna.setMember_userId(loginId);
		
		model.addAttribute("qna", qna);
		
	}
	
	@PostMapping("delete")
	public String remove(int qnaId) {
		qnaService.delete(qnaId);
		
		return "redirect:/main/list";
	}
	
}
