package kr.or.ddit.controller.common;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.service.common.NoticeBoardService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.PageVO;
import kr.or.ddit.vo.WeekplanVO;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Getter
@Setter
@Slf4j
@RequestMapping("/common/board/notice")
@Controller
public class NoticeBoardController {
	
	@Autowired
	NoticeBoardService noticeBoardService;
	
	@Autowired
	FileUtil fileUtil;
	
	private List<NoticeBoardVO> noticeBoardVOList;
	
 	@GetMapping(value="/list")
	public String list(Model model, Criteria cri) {
		
		List<NoticeBoardVO> list = this.noticeBoardService.list();
		log.info("list : " + list);
		
		model.addAttribute("list",list);
		
		model.addAttribute("list", noticeBoardService.getList(cri));
		
		model.addAttribute("pageMaker", new PageVO(cri, noticeBoardService.getTotal(cri)));
		
		return "board/noticeboard/list";
		
	}
	
	@GetMapping("/detail")
	public String detail(Model model, String nbCd) {
		log.info("nbCd : " + nbCd);
		NoticeBoardVO noticeBoardVO = this.noticeBoardService.detail(nbCd);
		
		log.info("NoticeBoardVO : "+ noticeBoardVO);
		
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		
		return "board/noticeboard/detail";
	}
	
	@GetMapping("/count")
	@ResponseBody
	public int count(String nbCd) {
			
		int cnt = this.noticeBoardService.count(nbCd);
		
		return cnt;
	}
	
	@GetMapping("/create")
	public String create() {
		//forwarding : jsp
		return "board/noticeboard/create";
	}
	
	@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
	@PostMapping("/createPost")
	public String createPost(NoticeBoardVO noticeBoardVO,
			Principal principal) {
	    //NoticeBoardVO(nbCd=null, empCd=null, fileCd=null, nbTitle=2, nbCon=3
		//, nbReg=null, nbUdt=null, nbCnt=0, userNm=이상민, filesDetailVOList=null
		//		, employeeVO=null, employeeVOList=null)
		//로그인한 아이디
		String empCd = principal.getName();
		noticeBoardVO.setEmpCd(empCd);
		
	    log.info("create->noticeBoardVO : " + noticeBoardVO);
	    
	    int result = this.noticeBoardService.create(noticeBoardVO);
	    log.info("result :" + result );

//	    if (result > 0) {
//	        // 게시물 생성 성공, 리다이렉트 URL을 반환
//	        return "redirect:/board/noticeboard/list";
//	    } else {
//	        // 게시물 생성 실패 처리
//	        return "error"; // 실패했을 경우에 대한 처리를 추가하세요
//	    }
	    
	    return "redirect:/common/board/notice/list";
	}
	
	// ../update?nbCd=2
	@GetMapping("/update")
	public String update(Model model, String nbCd) {
		log.info("nbCd : " + nbCd);
		NoticeBoardVO noticeBoardVO = this.noticeBoardService.detail(nbCd);
		log.info("NoticeBoardVO : "+ noticeBoardVO);
		
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		
		return "board/noticeboard/update";
	}
	
	@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
	@ResponseBody
	@PostMapping("/updatePost")
	public NoticeBoardVO updatePost(@RequestBody NoticeBoardVO noticeBoardVO,
			Principal principal) {
		String empCd = principal.getName();
		noticeBoardVO.setEmpCd(empCd);
		
	    log.info("updatePost->noticeBoardVO : " + noticeBoardVO);
	    
	    int result = this.noticeBoardService.updatePost(noticeBoardVO);
	    log.info("result :" + result );

	    return noticeBoardVO;
	}
	
//	@PostMapping("/updatePost")
//	public String updatePost(NoticeBoardVO noticeBoardVO) {
//
//
//		int result = this.noticeBoardService.updatePost(noticeBoardVO);
//
//		if (result > 0)
//			return "redirect:/common/board/notice/detail?nbCd=" + noticeBoardVO.getNbCd();
//		else
//			return "redirect:/common/board/notice/list";
//
//	}
	
	@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
	@ResponseBody
	@PostMapping("/deletePost")
	public Map<String,String> deletePost(@RequestBody Map<String,String> map, NoticeBoardVO noticeBoardVO,
			Principal principal) {
		String empCd = principal.getName();
		noticeBoardVO.setEmpCd(empCd);
		
		int result = this.noticeBoardService.deletePost(map);
		
	    log.info("delete->noticeBoardVO : " + map);
	    
	    Map<String, String> response = new HashMap<>();
	    response.put("result", (result > 0) ? "success" : "failure");
	    
	    return response;
	}
	
	@ResponseBody
	@GetMapping("/renderHome")
	public List<NoticeBoardVO> renderHome() {
		return this.noticeBoardService.renderHome();
	}
	
	//
	
	
	@ResponseBody
	@PostMapping("/fix")
    public String[] updateYN(String[] nbCd) {
		//[NOBD000814,NOBD972]
		log.info("nbCd : " + nbCd);
		for(String str : nbCd) {
			this.noticeBoardService.updateYN(str);
		}
		
        return nbCd;
    } 
	
	@ResponseBody
	@PostMapping("/fixClear")
    public String[] updateYNClear(String[] nbCd) {
		//[NOBD000814,NOBD972]
		log.info("nbCd : " + nbCd);
		for(String str : nbCd) {
			this.noticeBoardService.updateYNClear(str);
		}
		
        return nbCd;
    } 
    
    
    /**
	 * ckeditor로 파일 첨부하기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/fileuploadCK")
	public Map<String,Object> image(MultipartHttpServletRequest request) throws Exception {
		
		return fileUtil.uploadCkEditor(request);
	}
    
}
	


