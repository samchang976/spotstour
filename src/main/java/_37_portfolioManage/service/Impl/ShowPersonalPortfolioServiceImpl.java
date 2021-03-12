package _37_portfolioManage.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import _37_portfolioManage.dao.MemberDao;
import _37_portfolioManage.service.ShowPersonalPortfolioService;

@Service
public class ShowPersonalPortfolioServiceImpl implements ShowPersonalPortfolioService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Transactional
	@Override
	public List<Map<String, Object>> queryMemberPortfolio(Model model) {
		MemberDao mb = (MemberDao) memberDao.getMemberById((Integer) model.getAttribute("mId"));
		
		
		return null;
	}

}
