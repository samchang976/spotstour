package _00_util.Interceptor;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import _02_model.entity.MemberBean;



public class CheckLoginInterceptor extends HandlerInterceptorAdapter{
	List<String> url = Arrays.asList(
			"/_14_modifyMember/*" 

		);
	String servletPath;
	String contextPath;
	String requestURI;

	public CheckLoginInterceptor() {
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		boolean byPass = true;
		boolean isRequestedSessionIdValid = false;
		servletPath = req.getServletPath();  
		contextPath = req.getContextPath();
		requestURI  = req.getRequestURI();
		isRequestedSessionIdValid = req.isRequestedSessionIdValid();

		if (mustLogin()) {           
			if (checkLogin(req)) {    
				byPass = true;
			} else {				
				HttpSession session = req.getSession();
				if ( ! isRequestedSessionIdValid ) {
					session.setAttribute("timeOut", "使用逾時，請重新登入");
				} else {
					session.setAttribute("requestURI", requestURI);	
				}
				resp.sendRedirect(contextPath + "/_02_login/login");
				byPass = false;
			}
		} else {  
			byPass = true;
		}
		return byPass;
	}
	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		if (loginToken == null) {
			return false;
		} else {
			return true;
		}
	}
	private boolean mustLogin() {
		boolean login = false;
		for (String sURL : url) {
			if (sURL.endsWith("*")) {
				sURL = sURL.substring(0, sURL.length() - 1); 
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			} else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}
}
