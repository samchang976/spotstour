package _37_portfolioManage.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

public interface ShowPersonalPortfolioService {

	public List<Map<String, Object>> queryMemberPortfolio(Model model);
}
