package com.example.demo.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.example.demo.interceptor.Interceptor;

@Configuration
@MapperScan(basePackages = "com.example.demo")
public class DataBaseConfig extends WebMvcConfigurerAdapter{

		/*
		 	DataSource란? 
		 	데이터 베이스와 연동하는 작업이 많으므로 Connection Pool 에서 Connection 객체를 생성하고 
		 	DB작업시 빌린 후에 사용을 안하면 반납하는 효율적인 방법(연결할때마다 Connection 객체를 만들 필요가 없으므로)
		 */
	 	@Bean
	    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
	        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
	        sessionFactory.setDataSource(dataSource);
	        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
	        // 작성한 SQL문의 위치를 지정해줌
	        sessionFactory.setMapperLocations(resolver.getResources("classpath:mappers/*.xml"));
	        return sessionFactory.getObject();
	    }

	 	@Bean
	    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
	      final SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
	      return sqlSessionTemplate;
	    }
	 	
	 	@Autowired
	 	Interceptor interceptor;
	 	
	 	@Override
	 	public void addInterceptors(InterceptorRegistry registry) {
	 		registry.addInterceptor(interceptor)
	 				.addPathPatterns("/mypage")
	 				.addPathPatterns("/mypage_create")
	 				.addPathPatterns("/mypage_video_manage")
	 				.addPathPatterns("/mypage_videoList")
	 				.addPathPatterns("/mypage_videoDetail")
	 				.addPathPatterns("/mypage_videoUpdate")
	 				.addPathPatterns("/mypage_cartList")	 				
	 				.addPathPatterns("/mypage_cartDelete")
	 				.addPathPatterns("/mypage_info");
	 	}
	
}
