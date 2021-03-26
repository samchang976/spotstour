package _32_portfolioSearch.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ParamsBean;
import _02_model.entity.PortfolioBean;
import _02_model.entity.RecordBean;
import _32_portfolioSearch.dao.ParamsDao;
import _32_portfolioSearch.dao.RecordDao;
import _32_portfolioSearch.service.AddRecordService;
import _37_portfolioManage.dao.PortfolioDao;


@Service
public class AddRecordServiceImpl implements AddRecordService {

	@Autowired
	private PortfolioDao portfolioDao;
	@Autowired
	private ParamsDao paramsDao;
	@Autowired
	private RecordDao recordDao;
	
	@Override
	@Transactional
	public void addVRecord(Integer portfolioId, Integer params) {
		RecordBean recordBean = new RecordBean();
		PortfolioBean pfb = portfolioDao.queryPortfolioById(portfolioId);
		//觀看次數(無論身份:參數=>3,mId=>0)
		recordBean.setmId(0);
		recordBean.setPortfolioBean(pfb);
		ParamsBean pb = paramsDao.queryParamsById(params);
		recordBean.setParamsBean(pb);
		recordDao.addVRecord(recordBean);
	}

}
