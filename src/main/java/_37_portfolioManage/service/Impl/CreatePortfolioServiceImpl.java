package _37_portfolioManage.service.Impl;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _00_util.DateTimeUtils;
import _02_model.entity.CityBean;
import _02_model.entity.MemberBean;
import _02_model.entity.Place_TypeBean;
import _02_model.entity.PortfolioBean;
import _37_portfolioManage.controller.vo.PortfolioBeanVo;
import _37_portfolioManage.dao.PortfolioDao;
import _37_portfolioManage.dao.CityDao;
import _37_portfolioManage.dao.MemberDao;
import _37_portfolioManage.dao.Place_TypeDao;
import _37_portfolioManage.service.CreatePortfolioService;

@Service
public class CreatePortfolioServiceImpl implements CreatePortfolioService {

	@Autowired
	private PortfolioDao createPortfolioDao;
	@Autowired
	private MemberDao MemberDao;
	@Autowired
	private Place_TypeDao place_TypeDao;
	@Autowired
	private CityDao cityDao;
	
	@Override
	public void addPortfolio(PortfolioBeanVo portfolioBeanVo) {
		//準備一個對應資料庫的Bean
		PortfolioBean portfolioBean = new PortfolioBean();
		portfolioBean.setPortfolioName(portfolioBeanVo.getPortfolioName());
		portfolioBean.setP_createTime(DateTimeUtils.getTimestamps());
		portfolioBean.setpAddress(portfolioBeanVo.getpAddress());
		portfolioBean.setLatitude(portfolioBeanVo.getLatitude());
		portfolioBean.setLongitude(portfolioBeanVo.getLongitude());
		portfolioBean.setPortfolioText(portfolioBeanVo.getPortfolioText());
		//關聯會員的row
		Integer imId = portfolioBeanVo.getmId();
		MemberBean mb = MemberDao.getMemberById(imId);
		portfolioBean.setMemberBean(mb);
		//關聯地點類型的row
		Integer iptId = portfolioBeanVo.getPlaceTypeId();
		Place_TypeBean pt = place_TypeDao.getPlace_TypeById(iptId);
		portfolioBean.setPlace_TypeBean(pt);
		//關聯城市的row
		Integer icId = portfolioBeanVo.getCityId();
		CityBean cb = cityDao.getCityById(icId);
		portfolioBean.setCityBeans(cb);
		
		
		
	}

}
