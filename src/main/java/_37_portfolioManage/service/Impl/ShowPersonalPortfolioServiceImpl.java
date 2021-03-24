package _37_portfolioManage.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import _37_portfolioManage.controller.vo.ParamsBeanVo;
import _37_portfolioManage.dao.QueryPersonalPortfolioDao;
import _37_portfolioManage.service.ShowPersonalPortfolioService;

@Service
public class ShowPersonalPortfolioServiceImpl implements ShowPersonalPortfolioService {

	@Autowired
	private QueryPersonalPortfolioDao queryPersonalPortfolioDao;

	@Transactional
	@Override
	public List<Map<String, Object>> queryMemberPortfolio(Model model, ParamsBeanVo paramsBeanVo) {
		if (paramsBeanVo.getParam() == null) {
			return queryPersonalPortfolioDao.getMemberPortfolio((Integer) model.getAttribute("mId"));
		} else if (paramsBeanVo.getParam() == 1) {
			return queryPersonalPortfolioDao.getMemberPortfolioDESC((Integer) model.getAttribute("mId"));
		} else if (paramsBeanVo.getParam() == 2) {
			return queryPersonalPortfolioDao.getMemberPortfolioASC((Integer) model.getAttribute("mId"));
		}

		return queryPersonalPortfolioDao.getMemberPortfolio((Integer) model.getAttribute("mId"));
	}

}
