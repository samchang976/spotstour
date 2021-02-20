package _22_shoppingCart.dao;

import java.sql.Connection;
import java.util.List;

import _02_model.entity.test.OrderBean;


public interface OrderDao {

	void insertOrder(OrderBean ob);

	void setConnection(Connection con);

	OrderBean getOrder(int orderNo);

	List<OrderBean> getAllOrders();

	List<OrderBean> getMemberOrders(String memberId);

}