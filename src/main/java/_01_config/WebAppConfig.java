package _01_config;

//import javax.annotation.PostConstruct;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.orm.hibernate5.support.OpenSessionInViewInterceptor;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

//import _00_init.interceptor.DisableCacheInterceptor;
import _00_util.Interceptor.PermIdInterceptor;
//import _02_login.interceptor.CheckLoginInterceptor;

@Configuration
@EnableWebMvc 
@EnableTransactionManagement 
@ComponentScan({"_00_util", "_01_config", "_10_home", "_11_register", "_12_login","_13_mailVerification", "_14_modifyMember", "_21_merchandiseSearch", "_22_shoppingCart", "_23_submitOrder", "_24_contactUs", "_31_worldMap", "_32_portfolioSearch", "_37_portfolioManage", "_91_managerMart", "_92_managerReport" })
public class WebAppConfig implements WebMvcConfigurer {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	private RequestMappingHandlerAdapter requestMappingHandlerAdapter;
	
//	@PostConstruct
	public void init() {
		requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
	}
		
	//注入攔截器
	@Autowired
	private PermIdInterceptor permIdInterceptor;
	//註冊memberInterceptor攔截器,設置需要攔截的url請求路徑
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//權限攔截,進入各頁面後再從session取得權限值進行判斷畫面如何顯示
		registry.addInterceptor(permIdInterceptor).addPathPatterns("/memberDetailModify","/personalPortfolio");
		
        OpenSessionInViewInterceptor openSessionInViewInterceptor = new OpenSessionInViewInterceptor();
	    openSessionInViewInterceptor.setSessionFactory(factory);
	}

	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	
	//讓前端瀏覽器向後端要求靜態資源之設定
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//addResourceHandler:request路徑，addResourceLocations:真實路徑
		registry.addResourceHandler("/_00_util/allUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/allUtil/css/");
		registry.addResourceHandler("/_00_util/managerUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/managerUtil/css/");
		registry.addResourceHandler("/_00_util/memberUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/memberUtil/css/");
		registry.addResourceHandler("/_00_util/portfolioUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/portfolioUtil/css/");
		registry.addResourceHandler("/_00_util/shoppingMallUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/shoppingMallUtil/css/");
		
		//作品路徑設定
		registry.addResourceHandler("/vedioImages/**").addResourceLocations("/images/vedioImages/");
		registry.addResourceHandler("/videos/**").addResourceLocations("/videos/");
		
		registry.addResourceHandler("/_00_util/allUtil/javascript/**").addResourceLocations("/WEB-INF/views/_00_util/allUtil/javascript/");
		registry.addResourceHandler("/_00_util/managerUtil/javascript/**").addResourceLocations("/WEB-INF/views/_00_util/managerUtil/javascript/");
		registry.addResourceHandler("/_00_util/memberUtil/javascript/**").addResourceLocations("/WEB-INF/views/_00_util/memberUtil/javascript/");
		registry.addResourceHandler("/_00_util/portfolioUtil/javascript/**").addResourceLocations("/WEB-INF/views/_00_util/portfolioUtil/javascript/");
		registry.addResourceHandler("/_00_util/shoppingMallUtil/javascript/**").addResourceLocations("/WEB-INF/views/_00_util/shoppingMallUtil/javascript/");
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasenames("ValidationMessages");
		return messageSource;
	}
}
