package egovframework.soyul.orders.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.orders.OrdersVO;

public interface OrdersService {

	public OrdersVO ordersSelect(String orderId) throws Exception;

	public void ordersInsert(OrdersVO ordersVO) throws Exception;

	public List<EgovMap> allOrdersList()throws Exception;
	
	public List<EgovMap> memberOrdersList(String ordererId)throws Exception;
}
