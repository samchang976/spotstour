package _21_merchandiseSearch.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
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
	public List<CountryBean> getCountryById(int countryId) {
		return itemdao.getCountryById(countryId);
	}

}
