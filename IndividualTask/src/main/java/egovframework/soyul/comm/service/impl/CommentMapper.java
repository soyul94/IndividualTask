package egovframework.soyul.comm.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.comm.CommentVO;

@Mapper("commentMapper")
public interface CommentMapper {

	List<EgovMap> selectCommentList(CommentVO vo) throws Exception;
	
	int selectCommentListCnt(CommentVO vo) throws Exception;
	
	int insertComment(CommentVO vo) throws Exception;

	int deleteComment(CommentVO vo) throws Exception;

}
