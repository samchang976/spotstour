package _22_shoppingCart.vo;

public class SessionShoppingCartVo {
	
	private Integer itemId;
	private String itemHeader;
	private Integer itemPrice;
	private Integer itemQty;//庫存
	private String itemDes;
	private String itemPic1;
	private String itemPic2;
	private String itemPic3;
	private Integer scQty;

	public SessionShoppingCartVo() {
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemHeader() {
		return itemHeader;
	}

	public void setItemHeader(String itemHeader) {
		this.itemHeader = itemHeader;
	}

	public Integer getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Integer getItemQty() {
		return itemQty;
	}

	public void setItemQty(Integer itemQty) {
		this.itemQty = itemQty;
	}

	public String getItemDes() {
		return itemDes;
	}

	public void setItemDes(String itemDes) {
		this.itemDes = itemDes;
	}

	public String getItemPic1() {
		return itemPic1;
	}

	public void setItemPic1(String itemPic1) {
		this.itemPic1 = itemPic1;
	}

	public String getItemPic2() {
		return itemPic2;
	}

	public void setItemPic2(String itemPic2) {
		this.itemPic2 = itemPic2;
	}

	public String getItemPic3() {
		return itemPic3;
	}

	public void setItemPic3(String itemPic3) {
		this.itemPic3 = itemPic3;
	}

	public Integer getScQty() {
		return scQty;
	}

	public void setScQty(Integer scQty) {
		this.scQty = scQty;
	}
	
	

}
