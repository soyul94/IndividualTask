package egovframework.soyul.member.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.soyul.member.MemberVO;
import egovframework.soyul.member.service.MemberManageService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	/** cmmUseService */
//	@Resource(name = "EgovCmmUseService")
//	private EgovCmmUseService cmmUseService;
	
	/** mberManageService */
	@Resource(name = "memberManageService")
	private MemberManageService memberManageService;
	
	/**
	 * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/EgovIdDplctCnfirm
	 * @throws Exception
	 */
	@RequestMapping(value = "/idDplctCnfirmAjax.do", produces="application/text; charset=UTF-8")
	@ResponseBody	//해당 메서드의 반환값을 그대로 응답으로 전송 -> return을 jsp경로로 받지 않고 단순 문자열로 출력
//	public String checkIdDplctAjax(@RequestParam Map<String, Object> commandMap) throws Exception {
	public String checkIdDplctAjax(String emplyrId) throws Exception {

    	//ModelAndView modelAndView = new ModelAndView();
    	//modelAndView.setViewName("jsonView");

		//String checkId = (String) commandMap.get("checkId");
		//checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(emplyrId);
		int usedCnt = memberManageService.checkIdDplct(emplyrId);
		//modelAndView.addObject("usedCnt", usedCnt);
		//modelAndView.addObject("checkId", checkId);
		
		System.out.println(usedCnt);
		
		String result ="";
		
		if(usedCnt==0)
			result="사용 가능한 아이디입니다.";
		else
			result="사용 불가능한 아이디입니다.";
		
		
		
		return result;
	}
	
	
	@RequestMapping(value="/joinForm.do")
	public String joinForm(ModelMap model) throws Exception {
		System.out.println("/member/joinForm.do 실행");

		//패스워드힌트목록을 코드정보로부터 조회
		List<String> passwordHint_result = new ArrayList<String>();
		passwordHint_result.add("가장 기억에 남는 장소는?");
		passwordHint_result.add("나의 좌우명은?");
		passwordHint_result.add("나의 보물 제1호는?");
		passwordHint_result.add("가장 기억에 남는 선생님 성함은?");
		passwordHint_result.add("다른 사람은 모르는 나만의 신체비밀은?");
		passwordHint_result.add("오래도록 기억하고 싶은 날짜는?");
		passwordHint_result.add("받았던 선물 중 기억에 남는 독특한 선물은?");
		passwordHint_result.add("가장 생각나는 친구 이름은?");
		passwordHint_result.add("인상 깊게 읽은 책 이름은?");
		passwordHint_result.add("내가 존경하는 인물은?");
		passwordHint_result.add("나의 노래방 애창곡은?");
		passwordHint_result.add("가장 감명깊게 본 영화는?'");
		passwordHint_result.add("좋아하는 스포츠팀 이름은?");
		
		
		//성별구분코드를 코드정보로부터 조회
		List<String> sexdstnCode_result = new ArrayList<String>();
		sexdstnCode_result.add("M 남자");
		sexdstnCode_result.add("F 여자");
		
		
		//사용자상태코드를 코드정보로부터 조회
		
		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록

		
		return "/yul/join/joinForm";
	}
	
	
	@RequestMapping(value="/addMember.do")
	public String addMember(MemberVO memberVO, LoginVO login, ModelMap model) throws Exception{
		// 가입상태 초기화
		memberVO.setEmplyrSttusCode("가입완료");
		
		System.out.println(memberVO);
		
		// 일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
		memberManageService.insertMber(memberVO);
		return "forward:/main.do";
	}
	
}
