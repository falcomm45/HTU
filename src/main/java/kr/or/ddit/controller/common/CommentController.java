package kr.or.ddit.controller.common;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.common.CommentService;
import kr.or.ddit.vo.CommentVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
	
	private final CommentService commentService;
	
	@ResponseBody
	@PostMapping("/insert")
	public CommentVO insert(@RequestBody CommentVO commentVO, Principal principal) {
		
		log.info("commentVO ==> {}", commentVO);
		
		commentVO.setUserCd(principal.getName());
		this.commentService.insert(commentVO);
		return commentVO;
	}
	
	@ResponseBody
	@PostMapping("/insertNestedComment")
	public CommentVO insertNestedComment(@RequestBody CommentVO commentVO, Principal principal) {
		commentVO.setUserCd(principal.getName());
		this.commentService.insert(commentVO);
		return commentVO;
	}
	
	@ResponseBody
	@GetMapping("/getCommentByCmtCd")
	public CommentVO getCommentByCmtCd(String cmtCd) {
		return this.commentService.getCommentByCmtCd(cmtCd);
	}
	
	@ResponseBody
	@GetMapping("/delete")
	public String delete(String cmtCd) {
		log.info("cmtCd ==> {}", cmtCd);
		int result = this.commentService.delete(cmtCd);
		if (result > 0) return cmtCd;
		return null;
	}
}
