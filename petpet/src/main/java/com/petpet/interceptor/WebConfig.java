package com.petpet.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new LogInterceptor());
		
		registry.addInterceptor(new OldLoginInterceptor())
				.addPathPatterns("/member/*");
		
		registry.addInterceptor(new AdminInterceptor())
				.addPathPatterns("/member/*")
				.excludePathPatterns("/*");
	}
	
}
