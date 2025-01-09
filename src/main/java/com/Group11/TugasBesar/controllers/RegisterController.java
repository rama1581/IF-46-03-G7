package com.Group11.TugasBesar.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.admin.AdminService;
import com.Group11.TugasBesar.services.pemilikKost.PemilikKostService;
import com.Group11.TugasBesar.services.pencariKost.PencariKostService;

@SpringBootApplication
@Controller
public class RegisterController {

    @Autowired
    private PemilikKostService pemilikKostService;

    @Autowired
    private PencariKostService pencariKostService;

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage() {
        return "registerPage/registrationDecision";
    }


    @RequestMapping(value = "/register/pencari", method = RequestMethod.GET)
    public String registerAsPencariPage() {
        return "registerPage/registerAsPencari";
    }

    @RequestMapping(value = "/register/pencari", method = RequestMethod.POST)
    public String registerAsPencari(UserRequest userRequest, Model model) {
        
        Response response = pencariKostService.addPencariKost(userRequest);

        if (response.getStatus() == HttpStatus.CONFLICT.value()) {
            model.addAttribute("isAccountAlreadyExist", true);
            return "registerPage/registerAsPencari";
        } else {
            return "redirect:/login";
        }
        
    }


    @RequestMapping(value = "/register/pemilik", method = RequestMethod.GET)
    public String registerAsPemilikPage() {
        return "registerPage/registerAsPemilik";
    }

    @RequestMapping(value = "/register/pemilik", method = RequestMethod.POST)
    public String registerAsPemilik(UserRequest userRequest, Model model) {

        Response response = pemilikKostService.addPemilikKost(userRequest);

        if (response.getStatus() == HttpStatus.CONFLICT.value()) {
            model.addAttribute("isAccountAlreadyExist", true);
            return "registerPage/registerAsPemilik";
        } else {
            model.addAttribute("isRegistrationSuccess", true);
            return "redirect:/login";
        }
    }


    @RequestMapping(value = "/register/admin", method = RequestMethod.POST)
    public ResponseEntity<?> registerAsAdmin(@RequestBody UserRequest userRequest) {
        try {
            Response response = adminService.addAdmin(userRequest);
            return ResponseEntity.status(response.getStatus()).body(response);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }
}
