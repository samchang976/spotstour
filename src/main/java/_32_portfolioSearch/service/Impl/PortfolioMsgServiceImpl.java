package _32_portfolioSearch.service.Impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _00_util.DateTimeUtils;
import _02_model.entity.PortfolioBean;
import _02_model.entity.Portfolio_MsgBean;
import _32_portfolioSearch.controller.vo.Portfolio_MsgBeanVo;
import _32_portfolioSearch.dao.PortfolioMsgDao;
import _32_portfolioSearch.service.PortfolioMsgService;
import _37_portfolioManage.dao.PortfolioDao;

@Service
public class PortfolioMsgServiceImpl implements PortfolioMsgService{

	@Autowired
	PortfolioMsgDao portfolioMsgDao;
	@Autowired
	PortfolioDao portfolioDao;
	
	
	//查詢作品留言
	@Override
	@Transactional
	public List<Map<String, Object>> queryPortfolioMsg(Integer portfolioId) {
		return portfolioMsgDao.getPortfolioMsgList(portfolioId);
	}

	
	//新增作品留言
	@Override
	@Transactional
	public void addPortfolioMsg(Portfolio_MsgBeanVo portfolio_MsgBeanVo) {
		Portfolio_MsgBean portfolio_MsgBean = new Portfolio_MsgBean();
		portfolio_MsgBean.setPortfolioBean(portfolioDao.queryPortfolioById(portfolio_MsgBeanVo.getPortfolioId()));
		portfolio_MsgBean.setMsgText(portfolio_MsgBeanVo.getMsgText());
		portfolio_MsgBean.setPmsg_freeze(0);
		portfolio_MsgBean.setPm_createTime(DateTimeUtils.getTimestamps());
		portfolioMsgDao.addPortfolioMsg(portfolio_MsgBean);
	}

	
	//編輯作品留言(凍結)
	@Override
	@Transactional
	public void deletePortfolioMsg(Portfolio_MsgBeanVo portfolio_MsgBeanVo) {
		Portfolio_MsgBean portfolio_MsgBean = new Portfolio_MsgBean();
		portfolio_MsgBean.setPortfolioMsgId(portfolio_MsgBeanVo.getPortfolioMsgId());
		portfolio_MsgBean.setPortfolioBean(portfolioDao.queryPortfolioById(portfolio_MsgBeanVo.getPortfolioId()));
		portfolio_MsgBean.setMsgText(portfolio_MsgBeanVo.getMsgText());
		portfolio_MsgBean.setPmsg_freeze(1);
		portfolio_MsgBean.setPm_createTime(DateTimeUtils.getTimestamps());
		portfolioMsgDao.updatePortfolioMsg(portfolio_MsgBean);
	}

	
	
}
