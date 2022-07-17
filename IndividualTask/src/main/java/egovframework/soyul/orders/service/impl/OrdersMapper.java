package egovframework.soyul.orders.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.soyul.orders.OrdersVO;


@Mapper("ordersMapper")
public interface OrdersMapper {

	OrdersVO ordersSelect(OrdersVO ordersVO) throws Exception;

	void ordersInsert(OrdersVO ordersVO) throws Exception;

	List<EgovMap> allOrdersList() throws Exception;

	List<EgovMap> memberOrdersList(String ordererId) throws Exception;

	int memberOrdersCnt(String ordererId) throws Exception;

	int allOrdersCnt(String ordererId) throws Exception;

	int memberOrdersUpdate(OrdersVO ordersVO) throws Exception;

	int deleteOrders(OrdersVO ordersVO) throws Exception;
}
