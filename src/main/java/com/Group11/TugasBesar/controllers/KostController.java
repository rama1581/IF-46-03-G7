package com.Group11.TugasBesar.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.Room;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.kost.KostService;
import com.Group11.TugasBesar.services.room.RoomService;

@SpringBootApplication
@Controller
public class KostController {

    @Autowired
    private KostService kostService;

    @Autowired
    private RoomService roomService;

    @GetMapping(value = "/kost")
    public String kostPage() {
        return "searchPage/kostOption";
    }
    
    @GetMapping("/kost/search")
    public String searchKostPage(
    @RequestParam(name = "q", required = false) String query,
    @RequestParam(name = "allowedMale", required = false) Boolean allowedMale,
    @RequestParam(name = "allowedFemale", required = false) Boolean allowedFemale,
    Model model) {

    try {
        // Debugging parameter input
        System.out.println("Controller - Query: " + query);
        System.out.println("Controller - AllowedMale: " + allowedMale);
        System.out.println("Controller - AllowedFemale: " + allowedFemale);

        // Jika tidak ada pencarian (query kosong dan tidak ada pilihan checkbox), tidak kirim kost ke view
        if (query == null && allowedMale == null && allowedFemale == null) {
            model.addAttribute("kosts", null);
        } else {
            // Panggil service untuk mencari kost
            List<Kost> kosts = kostService.searchKost(query, allowedMale, allowedFemale);
            model.addAttribute("kosts", kosts);
        }

        model.addAttribute("query", query);
        model.addAttribute("allowedMale", allowedMale);
        model.addAttribute("allowedFemale", allowedFemale);

        return "searchPage/kostSearch"; // View JSP atau HTML
    } catch (Exception e) {
        model.addAttribute("message", e.getMessage());
        System.err.println("Error: " + e.getMessage());
        return "unexpectedError";
    }
}


    @GetMapping("/kost/{uuid}")
    public String getKostById(@PathVariable("uuid") int id, Model model) {
        
        Response response = kostService.getKostById(id);
        Kost kost = (Kost) response.getData();

        response = roomService.getRoomByKost(kost);
        List<Room> rooms = (List<Room>) response.getData();

        rooms.removeIf(room -> room.isBooked());

        model.addAttribute("rooms", rooms);
        model.addAttribute("address", kost.getAddress());

        return "searchPage/roomView";
    }

//     @GetMapping("/type/{type}")
//     public ResponseEntity<?> getKostByType(@PathVariable String type) {
    
//         List<Kost> kostList = KostService.getKostByType(type);
//             if (kostList.isEmpty()) {
//                 return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No kost found for type: " + type);
//     }
//         return ResponseEntity.ok(kostList);
// }

    @GetMapping("/putra")
    public String showPutraPage(
        @RequestParam(name = "q", required = false) String query,
    @RequestParam(name = "allowedMale", required = false) Boolean allowedMale,
    @RequestParam(name = "allowedFemale", required = false) Boolean allowedFemale,
    Model model
) {
    // Ambil semua kost lalu filter berdasarkan tipe "Campur"
    List<Kost> kosts = kostService.searchKost(query, allowedMale, allowedFemale)
                                  .stream()
                                  .filter(kost -> "Campur".equalsIgnoreCase(kost.getType()))
                                  .collect(Collectors.toList());

    model.addAttribute("kosts", kosts);
    model.addAttribute("query", query);
    model.addAttribute("allowedMale", allowedMale);
    model.addAttribute("allowedFemale", allowedFemale);
        return "listputra";
    }

    @GetMapping("/putri")
    public String showPutriPage(
    @RequestParam(name = "q", required = false) String query,
    @RequestParam(name = "allowedMale", required = false) Boolean allowedMale,
    @RequestParam(name = "allowedFemale", required = false) Boolean allowedFemale,
    Model model
) {
    // Ambil semua kost lalu filter berdasarkan tipe "Campur"
    List<Kost> kosts = kostService.searchKost(query, allowedMale, allowedFemale)
                                  .stream()
                                  .filter(kost -> "Campur".equalsIgnoreCase(kost.getType()))
                                  .collect(Collectors.toList());

    model.addAttribute("kosts", kosts);
    model.addAttribute("query", query);
    model.addAttribute("allowedMale", allowedMale);
    model.addAttribute("allowedFemale", allowedFemale);
        return "listputri";
    }

    @GetMapping("/campur")
public String showCampurPage(
    @RequestParam(name = "q", required = false) String query,
    @RequestParam(name = "allowedMale", required = false) Boolean allowedMale,
    @RequestParam(name = "allowedFemale", required = false) Boolean allowedFemale,
    Model model
) {
    // Ambil semua kost lalu filter berdasarkan tipe "Campur"
    List<Kost> kosts = kostService.searchKost(query, allowedMale, allowedFemale)
                                  .stream()
                                  .filter(kost -> "Campur".equalsIgnoreCase(kost.getType()))
                                  .collect(Collectors.toList());

    model.addAttribute("kosts", kosts);
    model.addAttribute("query", query);
    model.addAttribute("allowedMale", allowedMale);
    model.addAttribute("allowedFemale", allowedFemale);
    return "listCampur";
}

}
