package com.nhou.controller.qna;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhou.domain.member.MemberDto;
import com.nhou.domain.qna.QnAReplyDto;
import com.nhou.service.qna.QnAReplyService;

@Controller
@RequestMapping("qnaReply")
public class QnAReplyController {
	
	@Autowired
	private QnAReplyService qnaReplyService;
	
	//@PreAuthorize("@qnAReplySecurity.checkWriter(authentication.name, #qnaReplyId)")
	@PostMapping("insert")
	@ResponseBody
	public Map<String, Object> insert(@RequestBody QnAReplyDto qnaReply, Principal principal, MemberDto member){
		String loginId = principal.getName();	
		
		member.setUserId(loginId);
		qnaReply.setWriter(loginId);
		
		Map<String, Object> map = new HashMap<>();
		qnaReplyService.insertReply(qnaReply);
		
		return map;
	}
	
	@GetMapping("list/{qnaId}")
	@ResponseBody
	public List<QnAReplyDto> list(@PathVariable int qnaId){
		return qnaReplyService.listReplyByQnAId(qnaId);
	}
	
	@GetMapping("get/{qnaReplyId}")
	@ResponseBody
	public QnAReplyDto get(@PathVariable int qnaReplyId) {
		return qnaReplyService.getByQnAReplyId(qnaReplyId);
	}
	//@PreAuthorize("@qnAReplySecurity.checkWriter(authentication.name, #qnaReplyId)")
	@DeleteMapping("delete/{qnaReplyId}")
	@ResponseBody
	public void delete(@PathVariable int qnaReplyId, Principal principal, Model model) {
		String loginId = principal.getName();
		model.addAttribute("member", loginId);
		qnaReplyService.deleteByQnAReplyId(qnaReplyId);
	}
	//@PreAuthorize("@qnAReplySecurity.checkWriter(authentication.name, #qnaReplyId)")
	@PutMapping("edit")
	@ResponseBody
	public QnAReplyDto edit(@RequestBody QnAReplyDto qnaReply, Principal principal, MemberDto member) {
		String loginId = principal.getName();	
		member.setUserId(loginId);
		qnaReply.setWriter(loginId);
		
		return qnaReplyService.editReply(qnaReply);
	}
}
