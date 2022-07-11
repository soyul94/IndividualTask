package egovframework.soyul.review.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.review.ReviewVO;


public interface ReviewService {
	//게시물 목록 가져오기
	public ReviewVO selectReview(ReviewVO vo) throws Exception;
	
	//게시물 목록 가져오기
	public List<EgovMap> selectReviewList(ReviewVO vo) throws Exception;
	
	//게시물 목록 수
	public int selectReviewListCnt(ReviewVO vo) throws Exception;
	
	//게시물 등록
	public String insertReview(ReviewVO vo) throws Exception;
	
	//게시물 수정
	public void updateReview(ReviewVO vo) throws Exception;

	//게시물 삭제
	public void deleteReview(ReviewVO vo) throws Exception;
	
}

