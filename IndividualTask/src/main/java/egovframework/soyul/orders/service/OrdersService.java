package egovframework.soyul.orders.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.orders.OrdersVO;

public interface OrdersService {

	public OrdersVO ordersSelect(OrdersVO ordersVO) throws Exception;

	public void ordersInsert(OrdersVO ordersVO) throws Exception;

	public List<EgovMap> allOrdersList() throws Exception;
	
	public List<EgovMap> memberOrdersList(String ordererId) throws Exception;
	
	public List<String> memberOrdersListForReview(String ordererId) throws Exception;

	public int memberOrdersCnt(String ordererId) throws Exception;

	public int allOrdersCnt(String ordererId) throws Exception;

	public int memberOrdersUpdate(OrdersVO ordersVO) throws Exception;

	public int deleteOrders(OrdersVO ordersVO) throws Exception;
}
