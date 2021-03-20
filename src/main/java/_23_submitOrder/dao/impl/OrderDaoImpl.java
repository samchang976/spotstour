package _23_submitOrder.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.FeedbackBean;
import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;
import _02_model.entity.Ord_detailBean;
import _02_model.entity.Ord_statBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
import _23_submitOrder.dao.OrderDao;

@Repository
public class OrderDaoImpl implements Serializable, OrderDao {

	private static final long serialVersionUID = 1L;

	@Autowired
	SessionFactory factory = null;

	@Override
	public OrdBean getOrderByOrderId(int ord_Id) {
		Session session = factory.getCurrentSession();
		OrdBean ordBean = session.get(OrdBean.class, ord_Id);
		return ordBean;
	}

	@Override
	public void updateOrder(OrdBean ordBean) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(ordBean);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdBean> getAllOrders() {
		String hql = "FROM OrdBean ORDER BY ord_Id ASC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdBean> getAllOrdersByMemberId(int mTId) {
		String hql = "FROM OrdBean WHERE memberBean.mId = :id ORDER BY o_createTime ASC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql)
				.setParameter("id", mTId)
				.getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrdBean> getAllOrdersByMemberIdAndOrderStatId(int mId, Integer oSid) {
		String hql = "FROM OrdBean WHERE memberBean.mId = :id AND ordStatBean.oSid = :oSid ORDER BY o_createTime ASC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql)
				.setParameter("id", mId)
				.setParameter("oSid", oSid)
				.getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrdBean> getAllOrdersByOrderStatId(Integer oSid) {
		String hql = "FROM OrdBean WHERE ordStatBean.oSid = :oSid ORDER BY o_createTime ASC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql)
				.setParameter("oSid", oSid)
				.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdBean> getAllOrdersByShipTypeId(int shipTypeTId) {
		String hql = "FROM OrdBean WHERE shipTypeBean.shipTypeId = :id ORDER BY o_createTime ASC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql)
				.setParameter("id", shipTypeTId)
				.getResultList();
		return list;
	}

	@Override
	public void addOrderBean(OrdBean ordBean) {
		Session session = factory.getCurrentSession();
		session.save(ordBean);
	}

	@Override
	public MemberBean getMemberById(int mId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean mb WHERE mb.mId = :mId";
		//撈出會員ID對應的整個row
		return (MemberBean) session.createQuery(hql).setParameter("mId",mId).getSingleResult();
	}

	@Override
	public Receipt_TypeBean getReceipt_TypeById(int receiptTypeId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Receipt_TypeBean rtb WHERE rtb.receiptTypeId = :receiptTypeId";
		//撈出receiptTypeId對應的整個row
		return (Receipt_TypeBean) session.createQuery(hql).setParameter("receiptTypeId",receiptTypeId).getSingleResult();
	}

	@Override
	public Ship_TypeBean getShip_TypeById(int shipTypeId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ship_TypeBean stb WHERE stb.shipTypeId = :shipTypeId";
		//撈出shipTypeId對應的整個row
		return (Ship_TypeBean) session.createQuery(hql).setParameter("shipTypeId",shipTypeId).getSingleResult();
	}

	@Override
	public Ord_statBean getOrd_statById(int oSid) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ord_statBean osb WHERE osb.oSid = :oSid";
		//撈出oSid對應的整個row
		return (Ord_statBean) session.createQuery(hql).setParameter("oSid",oSid).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMemberList() {
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Receipt_TypeBean> getReceipt_TypeList() {
		String hql = "FROM Receipt_TypeBean";
		Session session = factory.getCurrentSession();
		List<Receipt_TypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ship_TypeBean> getShip_TypeList() {
		String hql = "FROM Ship_TypeBean";
		Session session = factory.getCurrentSession();
		List<Ship_TypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ord_statBean> getOrd_statList() {
		String hql = "FROM Ord_statBean";
		Session session = factory.getCurrentSession();
		List<Ord_statBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ord_detailBean> getAllOrd_detailsByOrd_Id(int ord_Id) {
		String hql = "FROM Ord_detailBean WHERE ord_Id = :id";
		Session session = factory.getCurrentSession();
		List<Ord_detailBean> list = session.createQuery(hql)
				.setParameter("id", ord_Id)
				.getResultList();
		return list;
	}

}
