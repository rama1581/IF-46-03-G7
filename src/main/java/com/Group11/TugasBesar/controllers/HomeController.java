package com.Group11.TugasBesar.controllers;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Group11.TugasBesar.annotations.CheckPencariKost;
import com.Group11.TugasBesar.models.Notification;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.notification.NotificationService;
import com.Group11.TugasBesar.services.pencariKost.PencariKostService;

import jakarta.servlet.http.HttpSession;


@CheckPencariKost
@SpringBootApplication
@Controller
public class HomeController {
    
    @Autowired
    private NotificationService notificationService;

    @Autowired
    private PencariKostService pencariKostService;

    @GetMapping("/home")
    public String homeLandingPage(HttpSession httpSession, Model model) {

        PencariKost pencariKost = (PencariKost) httpSession.getAttribute("LOGGED_USER");

        Response response = notificationService.getNotificationByPencariKost(pencariKost);
        List<Notification> notifications = (List<Notification>) response.getData();

        Date currentTime = new Date();
        
        List<Notification> filteredNotifications = notifications.stream()
            .filter(notification -> notification.getNotifyTime().before(currentTime))
            .collect(Collectors.toList());

        model.addAttribute("notifications", filteredNotifications);
        return "landingPage/indexPencariKost";
    }
    
    
}
