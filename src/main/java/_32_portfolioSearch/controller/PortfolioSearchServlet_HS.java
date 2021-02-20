package _32_portfolioSearch.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import _02_model.entity.ContinentBean;
import _32_portfolioSearch.service.PortfolioSearchService;





@WebServlet("/PortfolioSearchServlet")
public class PortfolioSearchServlet_HS extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		super.doGet(req, resp);
		String kw = req.getParameter("searchword");
//		int pw = Integer.valueOf(kw);
//		req.setAttribute("test", kw);
		ServletContext sc = getServletContext();
		WebApplicationContext ctx = 
				   WebApplicationContextUtils.getWebApplicationContext(sc);
		PortfolioSearchService service = ctx.getBean(PortfolioSearchService.class);
//		ContinentBean c = service.queryContinent(pw);
		ContinentBean cn = service.queryContinentName(kw);
//		ContinentBean ci continent.getContinentId();
		req.setAttribute("Continent", cn.getContinentName());
		for(int i = 1; i < cn.getCountryList().size() ; i++ ) {
		req.setAttribute("Country"+i, cn.getCountryList().get(i).getCountryName());}
		for(int i = 1; i < cn.getCountryList().get(i).getCityList().size() ; i++ ) {
		req.setAttribute("City"+i, cn.getCountryList().get(i).getCityList().get(i).getCityName());}
		
		RequestDispatcher rd = req.getRequestDispatcher("/_14_PortfolioSearchResult/PortfolioSearchResult.jsp");
		rd.forward(req, resp);
		return;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		super.doPost(req, resp);
	}

}
