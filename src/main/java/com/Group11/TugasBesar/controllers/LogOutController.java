package com.Group11.TugasBesar.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;



@SpringBootApplication
@Controller
public class LogOutController {

    @GetMapping("/logout")
    public String logOut(HttpSession httpSession) {
        httpSession.setAttribute("USER_TYPE", null);
        httpSession.setAttribute("LOGGED_USER", null);
        return "redirect:/";
    }
}