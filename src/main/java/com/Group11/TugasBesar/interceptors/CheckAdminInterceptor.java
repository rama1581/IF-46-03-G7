package com.Group11.TugasBesar.interceptors;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.Group11.TugasBesar.annotations.CheckAdmin;
import com.Group11.TugasBesar.models.Admin;

public class CheckAdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;

            
            CheckAdmin methodAnnotation = handlerMethod.getMethod().getAnnotation(CheckAdmin.class);

            
            CheckAdmin classAnnotation = handlerMethod.getBeanType().getAnnotation(CheckAdmin.class);

            
            
            if (methodAnnotation != null || classAnnotation != null) {
                System.out.println("In CheckPencariKostInterceptor.java:\nUSER_TYPE = " + request.getSession().getAttribute("USER_TYPE"));

                
                Object user = request.getSession().getAttribute("LOGGED_USER");
                if (!(user instanceof Admin)) {
                    response.sendRedirect("/login");
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}
