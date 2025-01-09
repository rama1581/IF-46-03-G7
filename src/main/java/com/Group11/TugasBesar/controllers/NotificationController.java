package com.Group11.TugasBesar.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.Group11.TugasBesar.models.Notification;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.notification.NotificationService;

import jakarta.servlet.http.HttpSession;


@Controller
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

   @GetMapping("/notifications")
public String showNotificationsPage(HttpSession httpSession, Model model) {
    
    PencariKost pencariKost = (PencariKost) httpSession.getAttribute("LOGGED_USER");
        int pencariKostId = pencariKost.getPencariKost_id();
        model.addAttribute("pencariKostId", pencariKostId);

    Response response = notificationService.getNotifications();

    List<Map<String, String>> formattedNotifications = new ArrayList<>();
    if (response.getData() != null) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        formattedNotifications = ((List<Notification>) response.getData()).stream()
            .map(notification -> {
                Map<String, String> map = new HashMap<>();
                map.put("message", notification.getMessage());
                map.put("notifyTime", notification.getNotifyTime() != null
                        ? dateFormat.format(notification.getNotifyTime())
                        : "Tanggal tidak tersedia");
                return map;
            }).collect(Collectors.toList());
    }

    model.addAttribute("notifications", formattedNotifications);
    return "notifications";
}
   
    
}
