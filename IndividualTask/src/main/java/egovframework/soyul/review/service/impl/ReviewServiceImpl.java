package egovframework.soyul.review.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;

import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.review.ReviewVO;
import egovframework.soyul.review.service.ReviewService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("reviewService") //service의 어노테이션은 프로젝트에 단 하나여야한다.
public class ReviewServiceImpl extends EgovAbstractServiceImpl implements ReviewService {
	
	@Resource(name="reviewMapper")
	private ReviewMapper reviewMapper;

	@Resource(name="soyulReviewIdGnrService") //context-idgen.xml에 추가한 bean을 연결하는 것
	private EgovIdGnrService idgenService;
	
	//게시물 상세정보
	public ReviewVO selectReview(ReviewVO vo) throws Exception {
		//조회수 증가
		reviewMapper.updateViewCnt(vo);
		
		return reviewMapper.selectReview(vo);	
	}
	
	//게시물 목록 가져오기
	public List<EgovMap> selectReviewList(ReviewVO vo) throws Exception{
		return reviewMapper.selectReviewList(vo);
	}
	
	//게시물 목록 수
	public int selectReviewListCnt(ReviewVO vo) throws Exception{
		return reviewMapper.selectReviewListCnt(vo);
	}


	//게시물 등록
	public String insertReview(ReviewVO vo) throws Exception{
		String id = idgenService.getNextStringId();
		vo.setReviewId(id);
		reviewMapper.insertReview(vo);
		
		return id;
	}
	
	//게시물 수정
	public void updateReview(ReviewVO vo) throws Exception{
		reviewMapper.updateReview(vo);
	}

	//게시물 삭제
	public void deleteReview(ReviewVO vo) throws Exception {
		reviewMapper.deleteReview(vo);		
	}	
	
}
