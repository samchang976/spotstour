package _32_portfolioSearch.dao;

import java.util.List;
import java.util.Map;

import _02_model.entity.RecordBean;

public interface RecordDao {

	public void addVRecord(RecordBean recordBean);

	public List<Map<String, Object>>  queryRecord(Integer portfolioId);
		
}
