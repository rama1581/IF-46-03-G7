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
import com.Group11.TugasBesar.services.user.UserService;

import jakarta.servlet.http.HttpSession;

@CheckPemilikKost
@SpringBootApplication
@Controller
public class EditController {

    @Autowired
    private KostService kostService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private UserService userService;

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
        } else {
            model.addAttribute("message", response.getMessage());
            return "unexpectedError";
        }
    } catch (Exception e) {
        model.addAttribute("message", e.getMessage());
        return "unexpectedError";
    }
}


    @GetMapping("/edit/kost/{uuid}")
    public String editKostPage(@PathVariable("uuid") int id, HttpSession session, Model model) {
    Response response = kostService.getKostById(id);
    if (response.getData() == null) {
        model.addAttribute("message", "Kost not found");
        return "unexpectedError";
    }
    model.addAttribute("kost", response.getData());
    return "pemilikKostPage/editKost";
}

@PostMapping("/edit/kost/{uuid}")
public String updateKost(@PathVariable("uuid") int id, KostRequest kostRequest, Model model) {
    try {
        Response response = kostService.getKostById(id);
        if (response.getData() == null) {
            model.addAttribute("message", "Kost not found");
            return "unexpectedError";
        }

        Kost kost = (Kost) response.getData();
        kost.setName(kostRequest.getName());
        kost.setAddress(kostRequest.getAddress());
        kost.setAllowedMale(kostRequest.isAllowedMale());
        kost.setAllowedFemale(kostRequest.isAllowedFemale());
        kost.setPrice(kostRequest.getPrice() != null ? kostRequest.getPrice() : kost.getPrice());

        Response updateResponse = kostService.updateKost(kost);

        if (updateResponse.getStatus() == HttpStatus.OK.value()) {
            return "redirect:/edit/kost";
        } else {
            model.addAttribute("message", updateResponse.getMessage());
            return "unexpectedError";
        }
    } catch (Exception e) {
        model.addAttribute("message", "Error occurred: " + e.getMessage());
        return "unexpectedError";
    }
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
    public String addRoomPage(@PathVariable("uuid") int id, HttpSession httpSession, Model model) {
        Response response = kostService.getKostById(id);

        if (response.getData() == null) { // Tambahkan validasi jika kost tidak ditemukan
            model.addAttribute("message", "Kost not found");
            return "unexpectedError"; // Redirect ke halaman error
        }

        Kost kost = (Kost) response.getData();
        model.addAttribute("kost", kost);
        return "pemilikKostPage/roomCreate"; // Halaman form untuk menambahkan room
    }
    
    
    @PostMapping("/edit/kost/{uuid}/room/create")
    public String addRoom(@PathVariable("uuid") int id, RoomRequest roomRequest, HttpSession httpSession, Model model) {
        Response response = kostService.getKostById(id);

        if (response.getData() == null) { // Validasi jika kost tidak ditemukan
            model.addAttribute("message", "Kost not found");
            return "unexpectedError";
        }

        Kost kost = (Kost) response.getData();
        roomRequest.setKost(kost); // Set Kost pada RoomRequest

        Response roomResponse = roomService.addRoom(roomRequest);

        if (roomResponse.getStatus() == HttpStatus.CREATED.value()) {
            return "redirect:/edit/kost/" + id + "/room"; // Redirect ke daftar room
        } else {
            model.addAttribute("message", "Failed to add room: " + roomResponse.getMessage());
            return "unexpectedError"; // Handle error dengan baik
        }
    }

    @GetMapping("/edit/kost/{kostId}/room/{roomId}")
    public String editRoomPage(@PathVariable("kostId") int kostId, @PathVariable("roomId") int roomId, Model model) {
        // Validasi Kost
        Response kostResponse = kostService.getKostById(kostId);
        if (kostResponse.getData() == null) {
            model.addAttribute("message", "Kost not found");
            return "unexpectedError";
        }
        Kost kost = (Kost) kostResponse.getData();
    
        // Validasi Room
        Response roomResponse = roomService.getRoomById(roomId);
        if (roomResponse.getData() == null) {
            model.addAttribute("message", "Room not found");
            return "unexpectedError";
        }
        Room room = (Room) roomResponse.getData();
    
        // Kirim data ke JSP
        model.addAttribute("kost", kost);
        model.addAttribute("room", room);
        return "pemilikKostPage/editRoom"; // Pastikan nama file JSP Anda sesuai
    }
    

    @PostMapping("/edit/kost/{kostId}/room/{roomId}")
    public String updateRoom(@PathVariable("kostId") int kostId, @PathVariable("roomId") int roomId, RoomRequest roomRequest, Model model) {
        try {
            Response roomResponse = roomService.getRoomById(roomId);
            if (roomResponse.getData() == null) {
                model.addAttribute("message", "Room not found");
                return "unexpectedError";
            }
            Room room = (Room) roomResponse.getData();
    
            // Perbarui data
            room.setPrice(roomRequest.getPrice());
            room.setDescription(roomRequest.getDescription());
    
            Response updateResponse = roomService.updateRoom(room);
            if (updateResponse.getStatus() == HttpStatus.OK.value()) {
                return "redirect:/edit/kost/" + kostId + "/room";
            } else {
                model.addAttribute("message", updateResponse.getMessage());
                return "unexpectedError";
            }
        } catch (Exception e) {
            model.addAttribute("message", "Error occurred: " + e.getMessage());
            return "unexpectedError";
        }
    }
    

}
