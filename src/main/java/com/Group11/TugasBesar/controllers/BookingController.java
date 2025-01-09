package com.Group11.TugasBesar.controllers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.Group11.TugasBesar.annotations.CheckPencariKost;
import com.Group11.TugasBesar.models.Booking;
import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.Room;
import com.Group11.TugasBesar.payloads.requests.BookingRequest;
import com.Group11.TugasBesar.payloads.requests.PaymentRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.booking.BookingService;
import com.Group11.TugasBesar.services.payment.PaymentService;
import com.Group11.TugasBesar.services.room.RoomService;

import jakarta.servlet.http.HttpSession;

@CheckPencariKost
@SpringBootApplication
@Controller
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private PaymentService paymentService;

    @GetMapping("/booking/list")
    public String bookingListPage(HttpSession httpSession) {

        // Take all booking from the logged user
        PencariKost pencariKost = (PencariKost) httpSession.getAttribute("LOGGED_USER");
        Response response = bookingService.getBookingByPencariKost(pencariKost);
        List<Booking> bookings = (List<Booking>) response.getData();

        httpSession.setAttribute("bookings", bookings);

        return "bookingPage/bookingList";
    }

    @GetMapping("/booking/{booking_id}")
    public String bookingLanding(@PathVariable("booking_id") int id) {
        return "redirect:/booking/" + id + "/date";
    }

    @GetMapping("/booking/{booking_id}/date")
    public String bookingDate(@PathVariable("booking_id") int id, Model model) {
        model.addAttribute("booking_id", id);
        return "bookingPage/bookingDate";
    }

    @GetMapping("/booking/{booking_id}/payment")
    public String bookingPayment(
            @RequestParam("entryDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date entryDate,
            @RequestParam("exitDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date exitDate,
            @PathVariable("booking_id") int booking_id,
            HttpSession httpSession,
            Model model) {

        // Find the booking record over the database
        Response bookingResponse = bookingService.getBookingById(booking_id);
        Booking booking = (Booking) bookingResponse.getData();

        // Set the room booked
        roomService.setRoomBooking(booking.getRoom().getRoom_id(), true);

        // Set the payment time limit of 2 hours
        Date date = new Date();                                 // Get current date and time
        Calendar calendar = Calendar.getInstance();             // Create a Calendar instance and set it to the current date and time
        calendar.setTime(date);
        calendar.add(Calendar.HOUR_OF_DAY, 2);
        Date twoHourTimeLimit = calendar.getTime();

            // Take the price rate from the the said room
            Room room = booking.getRoom();
            long price = room.getPrice();

            // Calculate the number of days passed
            long durationInMilliseconds = exitDate.getTime() - entryDate.getTime();     // Calculate the number of milliseconds between start date and end date
            double numberOfDays = TimeUnit.MILLISECONDS.toDays(durationInMilliseconds); // Convert milliseconds to days
            double numberOfMonths = numberOfDays / 30.0;                                // Convert days to months

            // Calculate and round the price
            double newPrice = price * numberOfMonths;
            long roundedPrice = Math.round(newPrice / 10.0) * 10;

        // Create new payment object
        PaymentRequest paymentRequest = new PaymentRequest();
        paymentRequest.setDateIssued(date);
        paymentRequest.setMethod(null);
        paymentRequest.setAmount(roundedPrice);
        paymentRequest.setStatus("awaiting payment");
        paymentRequest.setPencariKost(booking.getPencariKost());                        // Previously, payment's PencariKost were set in RoomController. But because booking can be claimed by other PencariKost if the payment havent been paid, this line of code reclaims other PencariKost as the new owner of the said booking
        paymentRequest.setPemilikKost(booking.getRoom().getKost().getPemilikKost());
        paymentRequest.setAdmin(null);
        Response paymentResponse = paymentService.addPayment(paymentRequest);

        // Update the booking
        BookingRequest bookingRequest = new BookingRequest();
        bookingRequest.setEntryDate(entryDate);
        bookingRequest.setExitDate(exitDate);
        bookingRequest.setExpireTime(twoHourTimeLimit);
        bookingRequest.setPencariKost(booking.getPencariKost());
        bookingRequest.setRoom(booking.getRoom());
        bookingRequest.setPayment( (Payment) paymentResponse.getData());
        bookingResponse = bookingService.updateBookingById(booking_id, bookingRequest);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("entryDate", dateFormat.format(entryDate));
        model.addAttribute("exitDate", dateFormat.format(exitDate));
        model.addAttribute("price", roundedPrice);
        model.addAttribute("booking_id", booking_id);

        return "bookingPage/bookingPayment";
    }

    @GetMapping("/booking/{booking_id}/confirm")
    public String bookConfirm(@PathVariable("booking_id") int booking_id, 
                          @RequestParam("method") String method, 
                          Model model) {

    Response response = bookingService.getBookingById(booking_id);
    Booking booking = (Booking) response.getData();

    // Update metode pembayaran
    paymentService.setPaymentMethod(booking.getPayment().getPayment_id(), method);

    // Cek metode pembayaran yang dipilih
    if ("Transfer Bank".equalsIgnoreCase(method)) {
        // Arahkan ke halaman pembayaran transfer bank
        model.addAttribute("payment", booking.getPayment());
        return "bookingPage/transferBankPayment"; // JSP untuk transfer bank
    }

    // Default: Arahkan ke halaman QRIS
    return "redirect:/booking/" + booking_id + "/qr";
}


   @GetMapping("/booking/{booking_id}/qr")
    public String bookQr(@PathVariable("booking_id") int booking_id, Model model, HttpSession session) {
    Response response = bookingService.getBookingById(booking_id);
    Booking booking = (Booking) response.getData();

    if (booking == null) {
        model.addAttribute("message", "Booking tidak ditemukan!");
        return "unexpectedError";
    }

    paymentService.setPaymentStatus(booking.getPayment().getPayment_id(), "paid");
    paymentService.transferToPemilikKost(booking.getPayment());

    PemilikKost pemilikKost = booking.getRoom().getKost().getPemilikKost();
    session.setAttribute("loggedPemilikKost", pemilikKost);

    model.addAttribute("message", "Pembayaran berhasil!");
    return "bookingPage/bookingQr";
}


}
