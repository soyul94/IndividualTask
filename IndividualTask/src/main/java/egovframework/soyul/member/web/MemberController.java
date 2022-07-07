package egovframework.soyul.member.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.soyul.member.service.EgovMberManageService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;
	
	
	@RequestMapping(value="/joinForm.do")
	public String joinForm(ModelMap model) throws Exception {
		

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
	
	public String addMember(MberManageVO user ,LoginVO login, ModelMap model) {
		
		return "";
	}
	
}
