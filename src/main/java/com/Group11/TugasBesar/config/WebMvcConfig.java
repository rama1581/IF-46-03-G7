package com.Group11.TugasBesar.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.Group11.TugasBesar.interceptors.CheckAdminInterceptor;
import com.Group11.TugasBesar.interceptors.CheckLoggedInInterceptor;
import com.Group11.TugasBesar.interceptors.CheckPemilikKostInterceptor;
import com.Group11.TugasBesar.interceptors.CheckPencariKostInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Bean
    public CheckLoggedInInterceptor checkLoggedInInterceptor() {
        return new CheckLoggedInInterceptor();
    }

    @Bean
    public CheckPemilikKostInterceptor checkPemilikKostInterceptor() {
        return new CheckPemilikKostInterceptor();
    }

    @Bean
    public CheckPencariKostInterceptor checkPencariKostInterceptor() {
        return new CheckPencariKostInterceptor();
    }

    @Bean
    public CheckAdminInterceptor checkAdminInterceptor() {
        return new CheckAdminInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // Add both interceptors and define the path patterns they should apply to
        registry.addInterceptor(checkLoggedInInterceptor()).addPathPatterns("/**");
        registry.addInterceptor(checkPemilikKostInterceptor()).addPathPatterns("/**");
        registry.addInterceptor(checkPencariKostInterceptor()).addPathPatterns("/**");
        registry.addInterceptor(checkAdminInterceptor()).addPathPatterns("/**");
    }
}
