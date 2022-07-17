package egovframework.soyul.orders.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	public OrdersVO ordersSelect(OrdersVO ordersVO) throws Exception {
		return ordersMapper.ordersSelect(ordersVO);
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
	
	@Override
	public List<String> memberOrdersListForReview(String ordererId) throws Exception {
		List<EgovMap> list = ordersMapper.memberOrdersList(ordererId);
		List<String> memberList = new ArrayList<String>();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		
		
		for(int i=0; i<list.size(); i++) {
//			String product = list.get(i).get("orderProductFirst") + list.get(i).get("orderProductMiddle")
//							+ list.get(i).get("orderProductLast") + list.get(i).get("orderProducPackage") ;
			
			String product = (dateFormat.format((Date)list.get(i).get("orderDate"))+" :   ");
			product += ((String)list.get(i).get("orderProductFirst")+" + ");
			product += ((String)list.get(i).get("orderProductMiddle")+" + ");
			product += ((String)list.get(i).get("orderProductLast")+" + ");
			product += (String)list.get(i).get("orderProductPackage");
			memberList.add(product);
		}
		
		return memberList;
	}

	@Override
	public int memberOrdersCnt(String ordererId) throws Exception {
		return ordersMapper.memberOrdersCnt(ordererId);
	}

	@Override
	public int allOrdersCnt(String ordererId) throws Exception {
		return ordersMapper.allOrdersCnt(ordererId);
	}

	@Override
	public int memberOrdersUpdate(OrdersVO ordersVO) throws Exception {
		return ordersMapper.memberOrdersUpdate(ordersVO);
	}

	@Override
	public int deleteOrders(OrdersVO ordersVO) throws Exception {
		return ordersMapper.deleteOrders(ordersVO);
	}

	
	
}
