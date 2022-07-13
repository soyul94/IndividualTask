package egovframework.soyul.comm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.comm.CommentVO;
import egovframework.soyul.comm.service.CommentService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("commentService") //service의 어노테이션은 프로젝트에 단 하나여야한다.
public class CommentServiceImpl implements CommentService {
	
	@Resource(name="commentMapper")
	private CommentMapper commentMapper;

	@Resource(name="soyulReviewCommentIdGnrService") //context-idgen.xml에 추가한 bean을 연결하는 것
	private EgovIdGnrService idgenService;

	@Override
	public List<EgovMap> selectCommentList(CommentVO vo) throws Exception {
		return commentMapper.selectCommentList(vo);
	}

	@Override
	public int selectCommentListCnt(CommentVO vo) throws Exception {
		return commentMapper.selectCommentListCnt(vo);
	}

	@Override
	public int insertComment(CommentVO vo) throws Exception {
		vo.setCommentId(idgenService.getNextStringId());
		return commentMapper.insertComment(vo);
	}

	@Override
	public void deleteComment(CommentVO vo) throws Exception {
		commentMapper.deleteComment(vo);
	}
	
	
	
}
