package egovframework.soyul.orders.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.soyul.member.MemberVO;
import egovframework.soyul.member.service.MemberManageService;
import egovframework.soyul.orders.OrdersVO;
import egovframework.soyul.orders.service.OrdersService;

@Controller
@RequestMapping(value="/orders")
public class OrdersController {
	
	@Resource(name="ordersService")
	private OrdersService ordersService;

	/** mberManageService */
	@Resource(name = "memberManageService")
	private MemberManageService memberManageService;
	
	
	
	@RequestMapping(value = "/select.do")
	public String BoardSelect(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model) throws Exception {

		System.out.println("/orders/select.do 컨트롤 호출");

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("USER_INFO", user);

		OrdersVO result = ordersService.ordersSelect(ordersVO);
		System.out.println(result);

	
		model.addAttribute("result", result);
		return "";
	}
	
	//주문 목록 페이지
	@RequestMapping(value="/list.do")
	public String ordersList(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, Model model)throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(ordersVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(ordersVO.getPageUnit());
		paginationInfo.setPageSize(ordersVO.getPageSize());
		
		ordersVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ordersVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ordersVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCot = 0;
		
		//리뷰 주문 목록 테이스
		List<String> orderlist = ordersService.memberOrdersListForReview(user.getId());
		for(String e : orderlist) {
			System.out.println(e);
		}
		
		
		if (user == null || user.getId() == null) {
			model.addAttribute("message", "로그인 후 사용가능합니다.");
			return "forward:/main.do"; // 로그인이 되어있지 않으면 리스트로 돌려보냄
		}
		else if(user.getId().equals("admin")) {
			totCot = ordersService.allOrdersCnt(user.getId());
			paginationInfo.setTotalRecordCount(totCot);
			model.addAttribute("paginationInfo", paginationInfo);
			
			List<EgovMap> allOrdersList = ordersService.allOrdersList();
			model.addAttribute("ordersList",allOrdersList);
			return "";
		}
		else {
			model.addAttribute("USER_INFO", user); // jsp에서 사용하기 위해 로그인 정보를 Attribute함.
			
			totCot = ordersService.memberOrdersCnt(user.getId());
			paginationInfo.setTotalRecordCount(totCot);
			model.addAttribute("paginationInfo", paginationInfo);
			
			List<EgovMap> memberOrdersList = ordersService.memberOrdersList(user.getId());
			model.addAttribute("ordersList",memberOrdersList);
			return "yul/orders/memberOrdersList";
		}
		
	}
	
	@RequestMapping(value="/form.do")
	public String ordersForm(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, Model model)throws Exception {
		MemberVO member;
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user == null || user.getId() == null) {
			model.addAttribute("message", "로그인 후 사용가능합니다.");
			return "forward:/main.do"; // 로그인이 되어있지 않으면 리스트로 돌려보냄
		}
		else if(user.getId().equals("admin")) {
			return "";
		}
		else {
			member = memberManageService.selectMber(user.getId());
			ordersVO = ordersService.ordersSelect(ordersVO);
			System.out.println(member);
			System.out.println(ordersVO);
			
			model.addAttribute("result",ordersVO);
			model.addAttribute("USER_INFO", member); // jsp에서 사용하기 위해 로그인 정보를 Attribute함.
		}
		
			
		return "yul/orders/memberOrdersForm";
	}
	
	@RequestMapping(value="insert.do")
	public String ordersInsert(@ModelAttribute("searchVO")OrdersVO ordersVO, Model model)throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user == null || user.getId() == null) {
			model.addAttribute("message", "로그인 후 사용가능합니다.");
			return "forward:/main.do"; // 로그인이 되어있지 않으면 리스트로 돌려보냄
		}
		else {
			model.addAttribute("USER_INFO", user); // jsp에서 사용하기 위해 로그인 정보를 Attribute함.
		}
		System.out.println(ordersVO);
		
		ordersService.ordersInsert(ordersVO);
		
		return "forward:/orders/list.do";
	}
	
	
	
	@RequestMapping(value="update.do")
	public String memberOrdersUpdate(@ModelAttribute("searchVO")OrdersVO ordersVO, Model model)throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user == null || user.getId() == null) {
			model.addAttribute("message", "로그인 후 사용가능합니다.");
			return "forward:/main.do"; // 로그인이 되어있지 않으면 리스트로 돌려보냄
		}
		else {
			model.addAttribute("USER_INFO", user); // jsp에서 사용하기 위해 로그인 정보를 Attribute함.
		}
		
		
		//ordersVO = ordersService.ordersSelect(ordersVO);
		System.out.println(ordersVO);
		
		int num = ordersService.memberOrdersUpdate(ordersVO);
		
		if(num!=0)
			model.addAttribute("message", "주문이 변경되었습니다.");
		
		return "forward:/orders/list.do";
	}
	
	
//	// 게시물 가져오기
//	@RequestMapping(value = "/select.do")
//	public String BoardSelect(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model)
//			throws Exception {
//
//		System.out.println("/review/select.do 컨트롤 호출");
//
//		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		model.addAttribute("USER_INFO", user);
//
//		ReviewVO result = reviewService.selectReview(reviewVO);
//		System.out.println(result);
//
//		// 비밀글 여부 체크
//		if ("Y".equals(result.getOthbcAt())) {
//			// 본인 및 관리자만 허용
//			if (user == null || user.getId() == null
//					|| (!user.getId().equals(result.getFrstRegisterId()) && !"admin".equals(user.getId()))) {
//				model.addAttribute("message", "작성자 본인만 확인 가능합니다.");
//				return "forward:/review/list.do";
//			}
//		}
//		
//		model.addAttribute("result", result);
//		return "yul/review/reviewSelect";
//	}
//	
//	
//	//게시물 목록 가져오기
//	@RequestMapping(value="/list.do")
//	public String reviewList(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model) throws Exception{
//		
//		System.out.println("/review/list.do 컨트롤 호출");	
//		
//		System.out.println(reviewVO.getSearchCondition());
//		System.out.println(reviewVO.getSearchKeyword());
//		
//		//공지 게시글
//		reviewVO.setNoticeAt("Y");
//		List<EgovMap> noticeResultList= reviewService.selectReviewList(reviewVO);
//		model.addAttribute("noticeResultList",noticeResultList);
//		
//		PaginationInfo paginationInfo = new PaginationInfo();
//		
//		paginationInfo.setCurrentPageNo(reviewVO.getPageIndex());
//		paginationInfo.setRecordCountPerPage(reviewVO.getPageUnit());
//		paginationInfo.setPageSize(reviewVO.getPageSize());
//		
//		reviewVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		reviewVO.setLastIndex(paginationInfo.getLastRecordIndex());
//		reviewVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//		
//		reviewVO.setNoticeAt("N");
//		List<EgovMap> resultList= reviewService.selectReviewList(reviewVO);
//		model.addAttribute("resultList",resultList);
//		
//		int totCot = reviewService.selectReviewListCnt(reviewVO);
//		
//		paginationInfo.setTotalRecordCount(totCot);
//		model.addAttribute("paginationInfo", paginationInfo);
//		
//		LoginVO user= (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
//		model.addAttribute("USER_INFO",user);
//		
//				
//		return "yul/review/reviewList";
//	}
//	
//	
//	
//	// 게시물 등록 및 수정 폼 호출
//	@RequestMapping(value = "/regist.do")
//	public String reviewRegist(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model) throws Exception {
//
//		System.out.println("/review/regist.do 컨트롤 호출");	
//
//		// 세션과 쿠키 공부하고 다시보기
//		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		
//		if (user == null || user.getId() == null) {
//			model.addAttribute("message", "로그인 후 사용가능합니다.");
//			return "forward:/review/list.do"; // 로그인이 되어있지 않으면 리스트로 돌려보냄
//		} else {
//			model.addAttribute("USER_INFO", user); // jsp에서 사용하기 위해 로그인 정보를 Attribute함.
//		}
//		
//
//		ReviewVO result = new ReviewVO();
//		if (!EgovStringUtil.isEmpty(reviewVO.getReviewId())) {
//			result = reviewService.selectReview(reviewVO);
//			// 본인 및 관리자만 허용
//			if (!user.getId().equals(result.getFrstRegisterId()) && !"admin".equals(user.getId())) {
//				model.addAttribute("message", "작성자 본인만 수정 가능합니다.");
//				return "forward:/review/list.do";
//			}
//		}
//		model.addAttribute("result", result);
//		
//		// insert에 있는 이중서브밋 방지를 위해 생성한 sessionBoard를 지워 새로 등록을 가능하도록 해줌
//		request.getSession().removeAttribute("sessionBoard");
//
//		return "yul/review/reviewRegist";
//	}
//	
//	
//	
//	// 입력받은 게시물 등록하는 메소드
//	@RequestMapping(value = "/insert.do")
//	public String reviewInsert(final MultipartHttpServletRequest multiRequest,
//			@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model) throws Exception {
//
//		System.out.println("/review/insert.do 컨트롤 호출");	
//		
//		// 이중 서브밋 방지 체크 : boardService.insertBoard를 수행 후 sessionBoard에 값이 저장되므로 이를 확인해서
//		// 중복 서브밋인지 감별함
//		if (request.getSession().getAttribute("sessionBoard") != null) {
//			return "forward:/review/list.do";
//		}
//
//		// 웹에서는 로그인 지속시간이 존재하기 때문에 게시글 입력중에 로그인이 풀릴 수 있음. 이때 로그인 정보가 없는 이를 insert하지 않도록
//		// 함
//		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		if (user == null || user.getId() == null) {
//			model.addAttribute("message", "로그인 후 사용가능합니다.");
//			return "forward:/review/list.do"; // 보통 이 경우는 로그인 페이지로 이동시킴
//		}
//
//		// 첨부파일
//		List<FileVO> result = null;
//		String atchFileId = "";
//
//		// 첨부파일 아이디는 로그인 계정마다 하나가 아니라 게시글마다 하나인가 ? ㅇㅇ 첨부파일id는 게시글당 1개 부여
//		final Map<String, MultipartFile> files = multiRequest.getFileMap();
//		if (!files.isEmpty()) {// 등록될 게시글의 첨부파일 유무를 검사하는 if문
//			result = fileUtil.parseFileInf(files, "REVIEW_", 0, "", "review.fileStorePath");
//			atchFileId = fileMngService.insertFileInfs(result);
//		}
//
//		reviewVO.setAtchFileId(atchFileId);
//
//		// 현재 작성자 기준의 IP를 불러옴(공인IP에 대한 정보)
//		reviewVO.setCreatIp(request.getRemoteAddr());
//		reviewVO.setUserId(user.getId());
//
//		reviewService.insertReview(reviewVO);
//
//		// 이중 서브밋 방지 : boardService.insertBoard(boardVO)를 수행 후 해당 정보를 session에 저장함
//		request.getSession().setAttribute("sessionBoard", reviewVO);
//
//		return "forward:/review/list.do";
//	}
//	
//	
//	
//	// 게시물 수정하는 메소드
//	@RequestMapping(value = "/update.do")
//	public String reviewUpdate(final MultipartHttpServletRequest multiRequest,
//			@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model) throws Exception {
//
//		System.out.println("/review/update.do 컨트롤 호출");
//
//		// 이중 서브밋 방지
//		if (request.getSession().getAttribute("sessionBoard") != null) {
//			return "forward:/review/list.do";
//		}
//
//		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		if (user == null || user.getId() == null) {
//			model.addAttribute("message", "로그인 후 사용가능합니다.");
//			return "forward:/review/list.do";
//		} else if ("admin".equals(user.getId())) {
//			reviewVO.setMngAt("Y");
//		}
//
//		String atchFileId = reviewVO.getAtchFileId();
//		final Map<String, MultipartFile> files = multiRequest.getFileMap();
//		if (!files.isEmpty()) {
//			if (EgovStringUtil.isEmpty(atchFileId)) {
//				List<FileVO> result = fileUtil.parseFileInf(files, "REVIEW_", 0, "", "review.fileStorePath");
//				atchFileId = fileMngService.insertFileInfs(result);
//				reviewVO.setAtchFileId(atchFileId);
//			} else {
//				FileVO fvo = new FileVO();
//				fvo.setAtchFileId(atchFileId);
//				int cnt = fileMngService.getMaxFileSN(fvo);
//				List<FileVO> _result = fileUtil.parseFileInf(files, "REVIEW_", cnt, atchFileId, "review.fileStorePath");
//				fileMngService.updateFileInfs(_result);
//			}
//		}
//
//		reviewVO.setUserId(user.getId());
//		System.out.println(reviewVO);
//		reviewService.updateReview(reviewVO);
//
//		// 이중 서브밋 방지 : boardService.insertBoard(boardVO)를 수행 후 해당 정보를 session에 저장함
//		request.getSession().setAttribute("sessionBoard", reviewVO);
//
//		return "forward:/review/list.do";
//	}
//	
//	
//	
//	// 게시물 삭제
//	@RequestMapping(value = "/delete.do")
//	public String reviewDelete(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model)
//			throws Exception {
//
//		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		if (user == null || user.getId() == null) {
//			model.addAttribute("message", "로그인 후 사용가능합니다.");
//			return "forward:/review/list.do";
//		} 
//		else if ("admin".equals(user.getId())) {
//			reviewVO.setMngAt("Y");
//		}
//		else if(!user.getId().equals(reviewVO.getFrstRegisterId())) {
//			System.out.println(user.getId());
//			System.out.println(reviewVO.getFrstRegisterId());
//			System.out.println(reviewVO.getReviewId());
//			model.addAttribute("message", "작성자 본인만 삭제가 가능합니다.");
//			return "forward:/review/list.do";
//		}
//
//		reviewVO.setUserId(user.getId());
//
//		reviewService.deleteReview(reviewVO);
//
//		return "forward:/review/list.do";
//	}
//	
	
}
