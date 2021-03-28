package _37_portfolioManage.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _32_portfolioSearch.dao.RecordDao;
import _37_portfolioManage.service.QueryRecordService;

@Service
public class QueryRecordServiceImpl implements QueryRecordService {

	@Autowired
	RecordDao recordDao;

	@Override
	@Transactional
	public List<Map<String, Object>> queryGBRecord(Integer portfolioId) {
		
		return recordDao.queryRecord(portfolioId);
	}
	
	
}
