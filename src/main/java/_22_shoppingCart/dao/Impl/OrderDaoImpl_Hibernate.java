package _22_shoppingCart.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.test.OrderBean;
import _22_shoppingCart.dao.OrderDao;



// 本類別
//   1.新增一筆訂單到orders表格
//   2.查詢orders表格內的單筆訂單
//   3.查詢orders表格內的所有訂單

@Repository
public class OrderDaoImpl_Hibernate implements OrderDao {
	
	private String memberId = null;
//	private Connection con;
	
	@Autowired
	SessionFactory factory;
	int orderNo = 0;

	public OrderDaoImpl_Hibernate() {
//		factory = HibernateUtils.getSessionFactory();
	}

	@Override
	public void insertOrder(OrderBean ob) {
        Session session = factory.getCurrentSession();
        session.save(ob);
	}

	public OrderBean getOrder(int orderNo) {
		OrderBean ob = null;
        Session session = factory.getCurrentSession();
        ob = session.get(OrderBean.class, orderNo);
        return ob;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setConnection(Connection con) {
        throw new RuntimeException("OrderDaoImpl_Hibernate類別不用實作此方法");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getAllOrders() {
        List<OrderBean> list = null;
        String hql = "FROM OrderBean";
        Session session = factory.getCurrentSession();
        
        list = session.createQuery(hql).list();
        return list;
	}

	@Override
	public List<OrderBean> getMemberOrders(String memberId) {
		List<OrderBean> list = null;
        Session session = factory.getCurrentSession();
        String hql = "FROM OrderBean ob WHERE ob.memberId = :mid";
        list = session.createQuery(hql).setParameter("mid", memberId).list();
        return list;

	}
	
}