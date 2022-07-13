package egovframework.soyul.orders.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.orders.OrdersVO;

public interface OrdersMapper {

	OrdersVO ordersSelect(String orderId) throws Exception;

	void ordersInsert(OrdersVO ordersVO) throws Exception;

	List<EgovMap> allOrdersList() throws Exception;

	List<EgovMap> memberOrdersList(String ordererId) throws Exception;

}
