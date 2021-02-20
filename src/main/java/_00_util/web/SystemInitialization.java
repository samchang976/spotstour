package _00_util.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import _00_util.GlobalService;



@WebListener
public class SystemInitialization implements ServletContextListener {
    public void contextDestroyed(ServletContextEvent sce)  { 
//    	HibernateUtils.getSessionFactory().close();
    }
    public void contextInitialized(ServletContextEvent sce)  { 
//    	HibernateUtils.getSessionFactory();
    	GlobalService  gs = new GlobalService();
    	ServletContext sc = sce.getServletContext();
    	sc.setAttribute("SYSTEM", gs);
    }
	
}
