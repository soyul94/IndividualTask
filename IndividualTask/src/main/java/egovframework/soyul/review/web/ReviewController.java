package egovframework.soyul.review.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/review")
public class ReviewController {

	@RequestMapping(value="/list.do")
	public String reviewList() throws Exception{
		
		return "yul/review/reviewList";
	}
	
	
}
