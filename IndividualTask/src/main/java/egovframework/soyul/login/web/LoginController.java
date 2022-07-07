package egovframework.soyul.login.web;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.uat.uia.service.EgovLoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {

	@Resource(name="loginService")
	private EgovLoginService loginService;
	
	@Resource(name="egovMessageSource")
	private EgovMessageSource egovMessageSource;
	
	
//	public String loginLayer(HttpServletRequest request, ModelMap model) throws Exception{
//		
//		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
//		model.addAttribute("USER_INFO",user);
//		
//		return "/yul/comm/logForm";
//	}
	
	@RequestMapping(value="/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		LoginVO resultVO = loginService.actionLogin(loginVO); //로그인한 사람이 상세정보 조회
		
		//조회한 resultVO가 null이거나 resultVO의 ID가 null이거나 ""이 모두 아닐 경우 resultVO의 정보를 session에 저장
		if(resultVO!=null && resultVO.getId()!=null && !resultVO.getId().equals("")) {
			request.getSession().setAttribute("LoginVO", resultVO);
//			return "forward:"+request.getHeader("Referer");
			return "forward:/main.do";
		}
		else {
			model.addAttribute("loginMessage",egovMessageSource.getMessage("fail.common.login"));
			return "forward:/main.do";
		}
		
	}
	
	@RequestMapping(value="/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception{
//		로그아웃에는 두가지 방식이 있고 정책에 따라 해야한다
		
//		1. /login/actionLogin.do에서 저장한 세션을 지워버림. 로그인 정보만 날리는 것
//		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);
		
//		2. 현재 접속한 사용자가 했던 모든 행위에 대한 세션들을 좌라락 날려버림
		request.getSession().invalidate(); //invalidate 무효화하다
		return "forward:/main.do";
	}
	
	
	
	
}
