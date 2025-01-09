package com.Group11.TugasBesar.controllers;

import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Group11.TugasBesar.annotations.CheckAdmin;
import com.Group11.TugasBesar.models.Booking;
import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.payloads.requests.NotificationRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.PemilikKostRepository;
import com.Group11.TugasBesar.services.booking.BookingService;
import com.Group11.TugasBesar.services.kost.KostService;
import com.Group11.TugasBesar.services.notification.NotificationService;
import com.Group11.TugasBesar.services.pemilikKost.PemilikKostService;
import com.Group11.TugasBesar.services.pencariKost.PencariKostService;

import jakarta.servlet.http.HttpSession;

@CheckAdmin
@SpringBootApplication
@Controller
public class DashboardController {

    @Autowired
    private PencariKostService pencariKostService;

    @Autowired
    private PemilikKostService pemilikKostService;

    @Autowired
    private KostService kostService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private PemilikKostRepository pemilikKostRepository;

    @GetMapping("/dashboard")
    public String dashboardPage() {
        return "redirect:/dashboard/pencariKost";
    }

     @GetMapping("/dashboard/kost")
    public String viewKosts(Model model) {
        
        Response kostResponse = kostService.getKosts();
        List<Kost> kosts = (List<Kost>) kostResponse.getData();

        model.addAttribute("kosts", kosts);

        return "dashboard/adminKost";
    }

    @PostMapping("/dashboard/kost/{kost_id}")
    public String kostApprove(@RequestParam(value = "approved") String approved, @PathVariable(value = "kost_id") int kost_id, Model model) {

        if (approved.equals("true")) {
            kostService.setKostApproved(kost_id, true);
        } else if (approved.equals("false")) {
            kostService.setKostApproved(kost_id, false);
        } else {
            model.addAttribute("message", "Unexpected error. Check om DashboardController");
            return "unexpectedError";
        }

        return "redirect:/dashboard/kost";
    }

    @GetMapping("/dashboard/booking")
    public String viewPayments(Model model) {

        Response bookingResponse = bookingService.getBookings();
        List<Booking> bookings = (List<Booking>) bookingResponse.getData();

        model.addAttribute("bookings", bookings);
        return "dashboard/adminBooking";
    }

    @PostMapping("/dashboard/booking/{booking_id}")
    public String postMethodName(@RequestParam(value = "paymentStatus") String paymentStatus,
            @PathVariable(value = "booking_id") int booking_id, Model model) {

        if (paymentStatus.equals("Menunggu Pembayaran")) {
            bookingService.setBookingPaymentStatus(booking_id, paymentStatus);
        } else if (paymentStatus.equals("Sudah Dibayar")) {
            bookingService.setBookingPaymentStatus(booking_id, paymentStatus);
        } else if (paymentStatus.equals("Dikonfirmasi")) {
            Response response = bookingService.setBookingPaymentStatus(booking_id, paymentStatus);
            Booking booking = (Booking) response.getData();

            Date currentDateAndTime = new Date();
            NotificationRequest notificationRequest = new NotificationRequest();

            notificationRequest.setMessage("An admin has confirmed your booking order!");
            notificationRequest.setNotifyTime(currentDateAndTime);
            notificationRequest.setPencariKost(booking.getPencariKost());
            notificationService.addNotification(notificationRequest);

            notificationRequest.setMessage("You can start GoLivin at room " + booking.getRoom().getRoom_id() + " and kost " + booking.getRoom().getKost().getName() + ". Enjoy your stay!");
            notificationRequest.setNotifyTime(booking.getEntryDate());
            notificationRequest.setPencariKost(booking.getPencariKost());
            notificationService.addNotification(notificationRequest);

            notificationRequest.setMessage("Your booking order at room " + booking.getRoom().getRoom_id() + " and kost " + booking.getRoom().getKost().getName() + " has expired. Thanks for your visit!");
            notificationRequest.setNotifyTime(booking.getExitDate());
            notificationRequest.setPencariKost(booking.getPencariKost());
            notificationService.addNotification(notificationRequest);

        } else {
            model.addAttribute("message", "Unexpected error. Check om DashboardController");
            return "unexpectedError";
        }

        return "redirect:/dashboard/booking";
    }

    @GetMapping("/dashboard/pencariKost")
    public String viewPencariKosts(Model model) {

        Response pencariKostResponse = pencariKostService.getPencariKosts();
        List<PencariKost> pencariKosts = (List<PencariKost>) pencariKostResponse.getData();

        model.addAttribute("pencariKosts", pencariKosts);
        return "dashboard/adminPencariKost";
    }

    @GetMapping("/indexPemilikKost")
    public String viewIndexPemilikKost(HttpSession session, Model model) {
        PemilikKost pemilikKost = (PemilikKost) session.getAttribute("LOGGED_USER");

        if (pemilikKost != null) {
            long balance = pemilikKostService.getBalanceByPemilikKostId(pemilikKost.getPemilikKost_id());
            model.addAttribute("balance", balance);
        } else {
            model.addAttribute("balance", 0);
        }

        return "indexPemilikKost";
    }
}

