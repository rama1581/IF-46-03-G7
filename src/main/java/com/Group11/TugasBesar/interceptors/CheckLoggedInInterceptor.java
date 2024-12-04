package com.Group11.TugasBesar.interceptors;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.Group11.TugasBesar.annotations.CheckLoggedIn;

public class CheckLoggedInInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;

            // Check for the annotation on the method
            CheckLoggedIn methodAnnotation = handlerMethod.getMethod().getAnnotation(CheckLoggedIn.class);

            // Check for the annotation on the class
            CheckLoggedIn classAnnotation = handlerMethod.getBeanType().getAnnotation(CheckLoggedIn.class);

            // If either the method or class is annotated, perform the check
            if (methodAnnotation != null || classAnnotation != null) {
                System.out.println("In CheckLoggedInInterceptor.java:\nUSER_TYPE = " + request.getSession().getAttribute("USER_TYPE"));
                
                // Check if user is logged in, otherwise redirect to login page
                Object user = request.getSession().getAttribute("LOGGED_USER");
                if (user == null) {
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
