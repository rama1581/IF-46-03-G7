package com.Group11.TugasBesar.controllers;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.LoginRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.user.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;


@SpringBootApplication
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage(HttpSession httpSession) {
        return "loginPage/login";
    }


    // @RequestMapping(value = "login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    // public String loginRequest(@RequestBody LoginRequest loginRequest, HttpSession httpSession, Model model) {
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginRequest(LoginRequest loginRequest, HttpSession httpSession, Model model) {

        Response response;
        try {
            response = userService.login(loginRequest);
            User user = (User) response.getData();

            // If the user with the same username and password was found
            if (response.getStatus() == HttpStatus.FOUND.value()) {

                // Check if user is a PencariKost, PemilikKost, or Admin
                if (user.getPencariKost() != null) {
                    PencariKost pencariKost = user.getPencariKost();

                    response.setData(pencariKost);
                    httpSession.setAttribute("LOGGED_USER", pencariKost);
                    httpSession.setAttribute("USER_TYPE", "PencariKost");
                    System.out.println("User is a PencariKost");
                    return "redirect:/";
                }
                else if (user.getPemilikKost() != null) {
                    PemilikKost pemilikKost = user.getPemilikKost();
                    
                    response.setData(pemilikKost);
                    httpSession.setAttribute("LOGGED_USER", pemilikKost);
                    httpSession.setAttribute("USER_TYPE", "PemilikKost");
                    System.out.println("User is a PemilikKost");
                    return "redirect:/";
                }
                else if (user.getAdmin() != null) {
                    Admin admin = user.getAdmin();
                    
                    response.setData(admin);
                    httpSession.setAttribute("LOGGED_USER", admin);
                    httpSession.setAttribute("USER_TYPE", "Admin");
                    System.out.println("User is a Admin");
                    return "redirect:/";
                }
                else {
                    response.setMessage("User is not PencariKost, PemilikKost, or Admin");
                    model.addAttribute("message", response.getMessage());
                    return "unexpectedError";
                }
            }
            else if (response.getStatus() == HttpStatus.UNAUTHORIZED.value()) {
                    model.addAttribute("isPasswordIncorrect", true);
                    return "loginPage/login";
                }
            else {
                model.addAttribute("message", "Error over LoginController");
                return "unexpectedError";
            }
        } catch (NoSuchElementException e) {
            model.addAttribute("isUserNonexistent", true);
            return "loginPage/login";
        }
    }

    @GetMapping("/login/admin")
    public String loginAsAdmin() {
        return "loginPage/loginAdmin";
    }
    
}
