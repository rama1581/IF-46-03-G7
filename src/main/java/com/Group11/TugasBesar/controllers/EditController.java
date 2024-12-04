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

import com.Group11.TugasBesar.annotations.CheckPemilikKost;
import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.Room;
import com.Group11.TugasBesar.payloads.requests.KostRequest;
import com.Group11.TugasBesar.payloads.requests.RoomRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.kost.KostService;
import com.Group11.TugasBesar.services.room.RoomService;

import jakarta.servlet.http.HttpSession;

@CheckPemilikKost
@SpringBootApplication
@Controller
public class EditController {

    @Autowired
    private KostService kostService;

    @Autowired
    private RoomService roomService;

    @GetMapping("/edit/kost")
    public String editLandingPage(HttpSession httpSession, Model model) {

        PemilikKost currentPemilikKost = (PemilikKost) httpSession.getAttribute("LOGGED_USER");
        // List<Kost> kosts = currentPemilikKost.getKosts();
        Response response = kostService.getKostByPemilikKost(currentPemilikKost);
        List<Kost> kosts = (List<Kost>) response.getData();

        model.addAttribute("kosts", kosts);
        return "landingPage/indexPemilikKost";
    }
    
    @GetMapping("/edit/kost/create")
    public String createKostPage(HttpSession httpSession) {
        return "pemilikKostPage/kostCreate";
    }

    @PostMapping("/edit/kost/create")
    public String createKost(HttpSession httpSession, KostRequest kostRequest, Model model) {
        try {
            PemilikKost pemilikKost = (PemilikKost) httpSession.getAttribute("LOGGED_USER");
            kostRequest.setPemilikKost(pemilikKost);
            Response response = kostService.addKost(kostRequest);

            if(response.getStatus() == HttpStatus.CREATED.value()) {
                return "redirect:/";
            }
            else {
                model.addAttribute("message", response.getMessage());
                return "unexpectedError";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "unexpectedError";
        }
    }

    @GetMapping("/edit/kost/{uuid}")
    public String editKostPage(@PathVariable("uuid") int id, HttpSession httpSession, Model model) {
        return "success";
    }

    @GetMapping("/edit/kost/{uuid}/room")
    public String showRoom(@PathVariable("uuid") int id, HttpSession httpSession, Model model) {
        Response response = kostService.getKostById(id);
        Kost kost = (Kost) response.getData();

        List<Room> rooms = kost.getRooms();
        model.addAttribute("rooms", rooms);
        return "pemilikKostPage/roomView";
    }
    
    @GetMapping("/edit/kost/{uuid}/room/create")
    public String addRoomPage(@PathVariable("uuid") int id) {
        return "pemilikKostPage/roomCreate";
    }
    
    
    @PostMapping("/edit/kost/{uuid}/room/create")
    public String addRoom(@PathVariable("uuid") int id, RoomRequest roomRequest) {

        Response response = kostService.getKostById(id);;
        Kost kost = (Kost) response.getData();

        roomRequest.setKost(kost);
        roomService.addRoom(roomRequest);
        
        return "redirect:/edit/kost/" + id + "/room";
    }
    
}
