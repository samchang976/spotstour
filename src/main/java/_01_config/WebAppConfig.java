package _01_config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc 
@ComponentScan({ "_10_home", "_11_register", "_12_login", "_21_merchandiseSearch", "_22_shoppingCart", "_23_submitOrder", "_24_contactUs","_32_portfolioSearch", "_32_portfolioSearch.service","_37_portfolioManage", "_91_managerMart" })
public class WebAppConfig implements WebMvcConfigurer {
	
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	//讓前端瀏覽器向後端要求靜態資源之設定
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//addResourceHandler:新增對應路徑，addResourceLocations:真實路徑
		registry.addResourceHandler("/_00_util/allUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/allUtil/css/");
		registry.addResourceHandler("/_00_util/managerUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/managerUtil/css/");
		registry.addResourceHandler("/_00_util/memberUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/memberUtil/css/");
		registry.addResourceHandler("/_00_util/portfolioUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/portfolioUtil/css/");
		registry.addResourceHandler("/_00_util/shoppingMallUtil/css/**").addResourceLocations("/WEB-INF/views/_00_util/shoppingMallUtil/css/");
		
//		registry.addResourceHandler("/image/**").addResourceLocations("\");
		//registry.addResourceHandler("/javascript/**").addResourceLocations("/javascript/");
	}

}
