package _37_portfolioManage.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import _37_portfolioManage.dao.QueryPersonalPortfolioDao;
import _37_portfolioManage.service.ShowPersonalPortfolioService;

@Service
public class ShowPersonalPortfolioServiceImpl implements ShowPersonalPortfolioService{
	
	@Autowired
	private QueryPersonalPortfolioDao queryPersonalPortfolioDao;
	
	@Transactional
	@Override
	public List<Map<String, Object>> queryMemberPortfolio(Model model) {
		
		return queryPersonalPortfolioDao.getMemberPortfolio((Integer) model.getAttribute("mId"));
	}

}
