package _37_portfolioManage.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.Place_TypeBean;
import _37_portfolioManage.dao.Place_TypeDao;

@Service
public class GetPlace_TypeListServiceImpl implements _37_portfolioManage.service.GetPlace_TypeListService {

	@Autowired
	private Place_TypeDao getPlace_TypeListDao;

	@Transactional
	@Override
	public List<Place_TypeBean> getPlace_TypeList() {
		return getPlace_TypeListDao.getPlace_TypeList();
	}

	
}
