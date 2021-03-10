package _23_submitOrder.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.CountryBean;
import _02_model.entity.FeedbackBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;
import _02_model.entity.Ord_detailBean;
import _02_model.entity.Ord_statBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
import _23_submitOrder.dao.OrderDao;
import _23_submitOrder.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDao orderDao;
	
	@Transactional
	@Override
	public OrdBean getOrderByOrderId(int ord_Id) {
		OrdBean ordBean = orderDao.getOrderByOrderId(ord_Id);
		return ordBean;
	}

	@Transactional
	@Override
	public void updateOrder(OrdBean ordBeanN) {
		OrdBean ordBeanO = orderDao.getOrderByOrderId(ordBeanN.getOrd_Id());
		MemberBean mb = orderDao.getMemberById(ordBeanN.getMemberBean().getmId());
		Receipt_TypeBean rtb = orderDao.getReceipt_TypeById(ordBeanN.getReceiptTypeBean().getReceiptTypeId());
		Ship_TypeBean stb = orderDao.getShip_TypeById(ordBeanN.getShipTypeBean().getShipTypeId());
		Ord_statBean osb = orderDao.getOrd_statById(ordBeanN.getOrdStatBean().getoSid());
		
		ordBeanO.setmTId(ordBeanN.getmTId());
		ordBeanO.setReceiptTypeTId(ordBeanN.getReceiptTypeTId());
		ordBeanO.setShipTypeTId(ordBeanN.getShipTypeTId());
		ordBeanO.setoSTid(ordBeanN.getoSTid());
		
		ordBeanO.setS_mAddress(ordBeanN.getS_mAddress());
		
		ordBeanO.setMemberBean(mb);
		ordBeanO.setReceiptTypeBean(rtb);
		ordBeanO.setShipTypeBean(stb);
		ordBeanO.setOrdStatBean(osb);
		orderDao.updateOrder(ordBeanO);
		
	}

	@Transactional
	@Override
	public List<OrdBean> getAllOrders() {
		return orderDao.getAllOrders();
	}

	@Transactional
	@Override
	public List<OrdBean> getAllOrdersByMemberId(int mId) {
		return orderDao.getAllOrdersByMemberId(mId);
	}

	@Transactional
	@Override
	public List<OrdBean> getAllOrdersByShipTypeId(int shipTypeId) {
		return orderDao.getAllOrdersByShipTypeId(shipTypeId);
	}

	@Transactional
	@Override
	public void addOrder(OrdBean ordBean) {
		orderDao.addOrder(ordBean);
	}

	@Transactional
	@Override
	public MemberBean getMemberById(int mId) {
		return orderDao.getMemberById(mId);
	}

	@Transactional
	@Override
	public Receipt_TypeBean getReceipt_TypeById(int receiptTypeId) {
		return orderDao.getReceipt_TypeById(receiptTypeId);
	}

	@Transactional
	@Override
	public Ship_TypeBean getShip_TypeById(int shipTypeId) {
		return orderDao.getShip_TypeById(shipTypeId);
	}

	@Transactional
	@Override
	public Ord_statBean getOrd_statById(int counoSidtryId) {
		return orderDao.getOrd_statById(counoSidtryId);
	}

	@Transactional
	@Override
	public List<MemberBean> getMemberList() {
		return orderDao.getMemberList();
	}

	@Transactional
	@Override
	public List<Receipt_TypeBean> getReceipt_TypeList() {
		return orderDao.getReceipt_TypeList();
	}

	@Transactional
	@Override
	public List<Ship_TypeBean> getShip_TypeList() {
		return orderDao.getShip_TypeList();
	}

	@Transactional
	@Override
	public List<Ord_statBean> getOrd_statList() {
		return orderDao.getOrd_statList();
	}
	
	//陳列訂單資訊
	@Transactional
	@Override
	public List<Ord_detailBean> getAllOrd_detailsByOrd_Id(int ord_Id) {
		return orderDao.getAllOrd_detailsByOrd_Id(ord_Id);
	}

}
