package _37_portfolioManage.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import _37_portfolioManage.controller.vo.ParamsBeanVo;

public interface ShowPersonalPortfolioService {

	public List<Map<String, Object>> queryMemberPortfolio(Model model,ParamsBeanVo paramsBeanVo);
}
