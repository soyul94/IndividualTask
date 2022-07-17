package egovframework.soyul.comm.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.comm.CommentVO;
import egovframework.soyul.comm.service.CommentService;
import egovframework.soyul.review.ReviewVO;
import egovframework.soyul.review.service.ReviewService;

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	
	@RequestMapping(value="/list.do")
	public String commentList(CommentVO commentVO, Model model) throws Exception {
		System.out.println("/comment/list.do 실행 !! ");
		
		List<EgovMap> list = commentService.selectCommentList(commentVO);
		int cnt = commentService.selectCommentListCnt(commentVO);
		
		model.addAttribute("commentList",list);
		model.addAttribute("commentListCnt",cnt);
		
		return "yul/comm/commentList";
	}
	
	@RequestMapping(value ="/insert.do" , produces="application/text; charset=UTF-8")
	@ResponseBody
	public String commentInsertAjax(@ModelAttribute("searchVO")CommentVO commentVO, Model model) throws Exception {
		System.out.println("/comment/insert.do 실행 !! ");
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if (user == null || user.getId() == null) {
			return "로그인 후 사용 가능합니다."; // 로그인이 되어있지 않으면 리스트로 돌려보냄
		}
		else{
			commentVO.setCommentRegisterId(user.getId());
			int num = commentService.insertComment(commentVO);
			return num + "개 댓글 입력 완료";
		}
	}
	
	@RequestMapping(value ="/delete.do" , produces="application/text; charset=UTF-8")
	@ResponseBody
	public String commentDeletetAjax(@ModelAttribute("searchVO")CommentVO commentVO, Model model) throws Exception {
		System.out.println("/comment/delete.do 실행 !! ");
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if (user == null || user.getId() == null) {
			return "로그인 후 사용 가능합니다."; // 로그인이 되어있지 않으면 리스트로 돌려보냄
		}
		else{
			commentVO.setCommentRegisterId(user.getId());
			int num = commentService.deleteComment(commentVO);
			
			System.out.println(commentVO);
			return num + "개 댓글 삭제 완료";
		}
	}
	
	

}
