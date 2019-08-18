package cn.fengyue.supermarket;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.DispatcherServlet;

@SpringBootApplication
@MapperScan("cn.fengyue.supermarket.mapper")
public class SupermarketApplication {

    public static void main(String[] args) {
        SpringApplication.run(SupermarketApplication.class, args);
    }

    /**
     * 设置匹配.action后缀的请求
     * @param dispatcherServlet
     * @return
     */
    /*@Bean
    public ServletRegistrationBean servletRegistrationBean(DispatcherServlet dispatcherServlet) {
        ServletRegistrationBean bean = new ServletRegistrationBean(dispatcherServlet);
        bean.addUrlMappings("*.action");
        return bean;
    }*/

}
