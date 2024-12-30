package com.Group11.TugasBesar.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
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
        // Menambahkan interceptor untuk memeriksa status login
        registry.addInterceptor(checkLoggedInInterceptor()).addPathPatterns("/**");
        
        // Menambahkan interceptor berdasarkan peran pengguna
        registry.addInterceptor(checkPemilikKostInterceptor()).addPathPatterns("/pemilik/**");
        registry.addInterceptor(checkPencariKostInterceptor()).addPathPatterns("/pencari/**");
        registry.addInterceptor(checkAdminInterceptor()).addPathPatterns("/admin/**");

        // Cek halaman yang hanya bisa diakses oleh pengguna yang terautentikasi
        registry.addInterceptor(checkLoggedInInterceptor())
                .addPathPatterns("/editprofile", "/profile", "/booking/**"); // Ganti dengan path yang sesuai
    }

    // Kelas AppConfig dipindahkan ke luar WebMvcConfig untuk menghindari masalah struktur
    @Configuration
    public static class AppConfig {
        @Bean
        public RestTemplate restTemplate() {
            return new RestTemplate();
        }
    }

    
}
