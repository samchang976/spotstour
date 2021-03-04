package _22_shoppingCart.service.impl;

import java.sql.Blob;

public interface ShoppingCartService {
	int getItemPrice(); //商品價錢
	String getItemHeader();//商品名稱
	Blob getItemPic();//商品照片
	int getItemQty();//商品庫存
	int getOrdQty();//選購數量
}
