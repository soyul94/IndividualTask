package egovframework.soyul.review.service.impl;
import java.util.Iterator;
import java.util.List;


import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.review.ReviewVO;

import org.springframework.stereotype.Repository;


@Mapper("reviewMapper")
public interface ReviewMapper {//DAO와 다르게 mapper는 동일 자바파일, 즉 한 mapper안에서의 중복이 아니면 중복되어도 무관함.
	//게시물 상세정보
	ReviewVO selectReview(ReviewVO vo) throws Exception;
	
	//조회수 증가
	void updateViewCnt(ReviewVO vo) throws Exception;
	
	//게시물 목록 가져오기
	List<EgovMap> selectReviewList(ReviewVO vo) throws Exception;	

	//게시물 목록 수
	int selectReviewListCnt(ReviewVO vo) throws Exception;
	
	//게시물 등록
	void insertReview(ReviewVO vo) throws Exception;
	
	//게시물 수정
	void updateReview(ReviewVO vo) throws Exception;

	//게시물 삭제
	void deleteReview(ReviewVO vo) throws Exception;

}

