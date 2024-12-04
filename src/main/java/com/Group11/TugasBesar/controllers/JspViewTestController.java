package com.Group11.TugasBesar.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.http.HttpSession;

@SpringBootApplication
@Controller
public class JspViewTestController {

    @RequestMapping(value = "view", method = RequestMethod.GET)
    public String registerPage(HttpSession session) {
        return "dashboard/loginAdmin";
    }
}
