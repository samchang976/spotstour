package _00_util.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

//@Component
public class ManagerInterceptor implements HandlerInterceptor {
	
	//進入controller前的攔截器
	//此攔截器攔截session判斷是否管理者
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//此處編寫攔截條件
		HttpSession session = request.getSession();
		String user =  (String) session.getAttribute("mAN");
		String mPidName =  (String) session.getAttribute("mPidName");
		Integer mPid = (Integer)session.getAttribute("mPid");
		if(mPid != null && mPid == 3 ) {
			System.out.println("User:" + user + ",權限:" + mPidName +" 確認身分完畢");	
			return true;
		}else {
			response.sendRedirect("login");
			System.out.println("權限不滿足,請登入...");
			return false;
		}
//		return true;

	}
	
	//進入controller後的攔截器
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}



}
