package _21_merchandiseSearch.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import _21_merchandiseSearch.service.ItemService;


@WebServlet("/_11_merchandiseSearch/Merchandise.do")

public class BuyItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request, response);
	}
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 只要舊的Session物件，如果找不到，不要建立新的Session物件，直接傳回 null
		HttpSession session = request.getSession(false); 

		if (session == null) {
			// 請使用者登入
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/_02_login/login.jsp"));
			return;
		}
		
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		ItemService itemService = ctx.getBean(ItemService.class);
		for (int i = 1; i < 3; i++) {
			session.setAttribute("itemHeader" + i, itemService.getItem(i).getItemHeader());
			session.setAttribute("itemPrice" + i, itemService.getItem(i).getItemPrice());
			session.setAttribute("countryId" + i, itemService.getItem(i).getCountryId());
			session.setAttribute("itemQty" + i, itemService.getItem(i).getItemQty());
		}
		
	
		RequestDispatcher rd = request.getRequestDispatcher("/_11_merchandiseSearch/MerchandiseIndex.jsp");
		rd.forward(request, response);
	}
}