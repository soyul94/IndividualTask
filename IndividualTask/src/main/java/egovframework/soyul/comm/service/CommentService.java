package egovframework.soyul.comm.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.comm.CommentVO;
import egovframework.soyul.review.ReviewVO;


public interface CommentService {
	
	public List<EgovMap> selectCommentList(CommentVO vo) throws Exception;
	
	public int selectCommentListCnt(CommentVO vo) throws Exception;
	
	public int insertComment(CommentVO vo) throws Exception;

	public int deleteComment(CommentVO vo) throws Exception;
	
}

