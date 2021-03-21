package _21_merchandiseSearch.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Ord_statBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
import _21_merchandiseSearch.dao.ItemDao;
import _21_merchandiseSearch.service.ItemService;



@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemDao itemdao;

	@Transactional
	@Override
	public ItemBean getItem(int itemId) {
		ItemBean itembean = null;
		itembean = itemdao.getItemByItemId(itemId);
		return itembean;
	}

	@Transactional
	@Override
	public List<CountryBean> getAllCountrys() {
		return itemdao.getAllCountrys();
	}

	@Transactional
	@Override
	public List<ItemBean> getItemByCountryId(int countryId) {
		return itemdao.getItemByCountryId(countryId);
	}
	
	@Transactional
	@Override
	public List<ItemBean> getTopSellItems(int i) {
		return itemdao.getTopSellItems(i);
	}
	
	@Transactional
	@Override
	public ItemBean getItemById(int itemId) {
		return itemdao.getItemById(itemId);
	}

	@Transactional
	@Override
	public List<Ship_TypeBean> getShip_TypeList() {
		return itemdao.getShip_TypeList();
	}
	
	@Transactional
	@Override
	public List<Receipt_TypeBean> getReceipt_TypeList() {
		return itemdao.getReceipt_TypeList();
	}

	@Transactional
	@Override
	public Set<ItemBean> getItemBySearchBar(String searchBar, Integer time) {
		return itemdao.getItemBySearchBar(searchBar, time);
	}

	@Transactional
	@Override
	public List<ItemBean> getAllItems() {
		return itemdao.getAllItems();
	}

}
