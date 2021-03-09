package _23_submitOrder.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;
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
		String hql = "FROM OrdBean ORDER BY ord_Id DESC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdBean> getAllOrdersByMemberId(int mTId) {
		String hql = "FROM OrdBean WHERE mTId = :id ORDER BY o_createTime DESC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql)
				.setParameter("id", mTId)
				.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdBean> getAllOrdersByShipTypeId(int shipTypeTId) {
		String hql = "FROM OrdBean WHERE shipTypeTId = :id ORDER BY o_createTime DESC";
		Session session = factory.getCurrentSession();
		List<OrdBean> list = session.createQuery(hql)
				.setParameter("id", shipTypeTId)
				.getResultList();
		return list;
	}

	@Override
	public void addOrder(OrdBean ordBean) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getMemberById(ordBean.getmTId()); 
		Receipt_TypeBean rtb = getReceipt_TypeById(ordBean.getReceiptTypeTId());
		Ship_TypeBean sb = getShip_TypeById(ordBean.getShipTypeTId());
		Ord_statBean osb = getOrd_statById(ordBean.getoSTid());
		
		ordBean.setMemberBean(mb);
		ordBean.setReceiptTypeBean(rtb);
		ordBean.setShipTypeBean(sb);
		ordBean.setOrdStatBean(osb);
		session.save(ordBean);
	}

	@Override
	public MemberBean getMemberById(int mId) {
		Session session = factory.getCurrentSession();
		MemberBean memberBean = session.get(MemberBean.class, mId);
		return memberBean;
	}

	@Override
	public Receipt_TypeBean getReceipt_TypeById(int receiptTypeId) {
		Session session = factory.getCurrentSession();
		Receipt_TypeBean receipt_TypeBean = session.get(Receipt_TypeBean.class, receiptTypeId);
		return receipt_TypeBean;
	}

	@Override
	public Ship_TypeBean getShip_TypeById(int shipTypeId) {
		Session session = factory.getCurrentSession();
		Ship_TypeBean ship_TypeBean = session.get(Ship_TypeBean.class, shipTypeId);
		return ship_TypeBean;
	}

	@Override
	public Ord_statBean getOrd_statById(int counoSidtryId) {
		Session session = factory.getCurrentSession();
		Ord_statBean ord_statBean = session.get(Ord_statBean.class, counoSidtryId);
		return ord_statBean;
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

}
