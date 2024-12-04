package com.Group11.TugasBesar.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;

import jakarta.servlet.http.HttpSession;

@SpringBootApplication
@Controller
public class TestController {

    @RequestMapping(value = "/test")
    public String testPage(HttpSession httpSession, Model model) {
        System.out.println("In LandingPage.jsp");
        System.out.println("USER_TYPE           : " + httpSession.getAttribute("USER_TYPE"));
        System.out.println("LOGGED_USER is null?: " + (httpSession.getAttribute("LOGGED_USER") == null));

        Object user = httpSession.getAttribute("LOGGED_USER");

        if      (user == null)                  {return "landingPage/index";}
        else if (user instanceof PencariKost)   {return "landingPage/indexPencariKost";}
        else if (user instanceof PemilikKost)   {return "redirect:/edit/kost";}
        else if (user instanceof Admin)         {return "redirect:/dashboard";}
        else                                    {return "test";}
    }
}
