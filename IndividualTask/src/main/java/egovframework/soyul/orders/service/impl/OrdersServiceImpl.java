package egovframework.soyul.orders.service.impl;

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
import egovframework.soyul.orders.OrdersVO;
import egovframework.soyul.orders.service.OrdersService;
import egovframework.soyul.review.ReviewVO;
import egovframework.soyul.review.service.ReviewService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("ordersService") //service의 어노테이션은 프로젝트에 단 하나여야한다.
public class OrdersServiceImpl extends EgovAbstractServiceImpl implements OrdersService {
	
	@Resource(name="ordersMapper")
	private OrdersMapper ordersMapper;

	@Resource(name="soyulOrdersCommentIdGnrService") //context-idgen.xml에 추가한 bean을 연결하는 것
	private EgovIdGnrService idgenService;

	@Override
	public OrdersVO ordersSelect(String orderId) throws Exception {
		return ordersMapper.ordersSelect(orderId);
	}

	@Override
	public void ordersInsert(OrdersVO ordersVO) throws Exception {
		
		ordersVO.setOrderId(idgenService.getNextStringId());
		
		ordersMapper.ordersInsert(ordersVO);
	}

	@Override
	public List<EgovMap> allOrdersList() throws Exception {
		return ordersMapper.allOrdersList();
	}

	@Override
	public List<EgovMap> memberOrdersList(String ordererId) throws Exception {
		return ordersMapper.memberOrdersList(ordererId);
	}
	
}
