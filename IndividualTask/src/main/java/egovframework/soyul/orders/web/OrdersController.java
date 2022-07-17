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
		
		// insert에 있는 이중서브밋 방지를 위해 생성한 sessionMemberInfo를 지워 새로 등록을 가능하도록 해줌
		request.getSession().removeAttribute("sessionOrderInfo");
		
		return "yul/orders/memberOrdersForm";
	}
	
	@RequestMapping(value="insert.do")
	public String ordersInsert(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, Model model)throws Exception {
		
		// 중복 서브밋인지 감별함
		if (request.getSession().getAttribute("sessionOrderInfo") != null) {
			return "forward:/orders/list.do";
		}
		
		
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
		
		// 이중 서브밋 방지 : ordersService.ordersInsert(ordersVO)를 수행 후 해당 정보를 session에 저장함
		request.getSession().setAttribute("sessionOrderInfo", ordersVO);
		
		return "forward:/orders/list.do";
	}
	
	
	
	@RequestMapping(value="update.do")
	public String memberOrdersUpdate(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, Model model)throws Exception {
		
		// 중복 서브밋인지 감별함
		if (request.getSession().getAttribute("sessionOrderInfo") != null) {
			return "forward:/orders/list.do";
		}
		
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
		
		// 이중 서브밋 방지 : ordersService.ordersInsert(ordersVO)를 수행 후 해당 정보를 session에 저장함
		request.getSession().setAttribute("sessionOrderInfo", ordersVO);
		
		return "forward:/orders/list.do";
	}
	
	
	// 게시물 삭제
	@RequestMapping(value = "/delete.do")
	public String reviewDelete(@ModelAttribute("searchVO")OrdersVO ordersVO, HttpServletRequest request, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user == null || user.getId() == null) {
			model.addAttribute("message", "로그인 후 사용가능합니다.");
			return "forward:/orders/list.do";
		} 
		else if(!user.getId().equals(ordersVO.getOrdererId())) {
			model.addAttribute("message", "작성자 본인만 삭제가 가능합니다.");
			return "forward:/orders/list.do";
		}

		ordersVO.setOrdererId(user.getId());

		ordersService.deleteOrders(ordersVO);

		return "forward:/orders/list.do";
	}
	
}
