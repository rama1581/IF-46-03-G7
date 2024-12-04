package com.Group11.TugasBesar.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.Room;
import com.Group11.TugasBesar.payloads.requests.KostRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.kost.KostService;

import jakarta.servlet.http.HttpSession;


@SpringBootApplication
@Controller
public class EditController {

    @Autowired
    private KostService kostService;
    
    @GetMapping(value = "/edit/kost/create")
    public String createKostPage(HttpSession httpSession) {
        return "kostCreate";
    }

    @PostMapping(value = "/edit/kost/create")
    public String createKost(HttpSession httpSession, KostRequest kostRequest, Model model) {
        try {
            PemilikKost pemilikKost = (PemilikKost) httpSession.getAttribute("LOGGED_USER");
            kostRequest.setPemilikKost(pemilikKost);
            Response response = kostService.addKost(kostRequest);

            if(response.getStatus() == HttpStatus.CREATED.value()) {
                return "landingPage/indexPemilik";
            }
            else {
                model.addAttribute("message", response.getMessage());
                return "unexpectedError";
            }
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "unexpectedError";
        }
    }

    @GetMapping(value = "/edit/kost/{uuid}")
    public String editKostPage(@PathVariable("uuid") int id, HttpSession httpSession, Model model) {
        Response response = kostService.getKostById(id);
        Kost kost = (Kost) response.getData();

        List<Room> rooms = kost.getRooms();
        model.addAttribute("rooms", rooms);
        
        return "kostCreate";
    }
}
