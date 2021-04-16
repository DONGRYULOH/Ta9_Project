package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	// 로컬뿐만 아니라 외부 URL로도 위치를 설정해줄수 있음(참고 : https://zepinos.tistory.com/36) 
	// 동영상 파일같은 경우는 용량이 크기 때문에 동영상 파일만을 모아두는 저장소를 외부에 만들어서 그쪽에서 관리하는게 일반적임 
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/fileUpload/**")
				.addResourceLocations("file:///videoFileUpload/");
		
	}

}
