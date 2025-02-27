package _23_submitOrder.service;

import java.util.List;

import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;
import _02_model.entity.Ord_detailBean;
import _02_model.entity.Ord_statBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
import _23_submitOrder.vo.OrderVo;

public interface OrderService {

	OrdBean getOrderByOrderId(int ord_Id);

	void updateOrder(OrdBean ordBean);

	// 陳列全部訂單
	public List<OrdBean> getAllOrders();

	// 依會員查詢所有訂單
	public List<OrdBean> getAllOrdersByMemberId(int mId);

	// 依會員和訂單狀態查詢訂單
	public List<OrdBean> getAllOrdersByMemberIdAndOrderStatId(int mId, Integer oSid);
	
	// 依會員和訂單狀態查詢訂單
	public List<OrdBean> getAllOrdersByOrderStatId(Integer oSid);

	// 陳列狀態全部訂單
	public List<OrdBean> getAllOrdersByShipTypeId(int shipTypeId);

	public void addOrderBean(OrdBean ordBean);

	public MemberBean getMemberById(int mId);

	public Receipt_TypeBean getReceipt_TypeById(int receiptTypeId);

	public Ship_TypeBean getShip_TypeById(int shipTypeId);

	public Ord_statBean getOrd_statById(int counoSidtryId);

	List<MemberBean> getMemberList();

	List<Receipt_TypeBean> getReceipt_TypeList();

	List<Ship_TypeBean> getShip_TypeList();

	List<Ord_statBean> getOrd_statList();

	List<Ord_detailBean> getAllOrd_detailsByOrd_Id(int ord_Id);

	public OrdBean addOrderVo(OrderVo orderVo);
}
