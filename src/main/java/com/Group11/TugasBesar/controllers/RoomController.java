package com.Group11.TugasBesar.controllers;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.Group11.TugasBesar.annotations.CheckPencariKost;
import com.Group11.TugasBesar.models.Booking;
import com.Group11.TugasBesar.models.Payment;
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
public class RoomController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private RoomService roomService;
    
    @GetMapping("/room/{room_id}/book")
    public String bookRoom(@PathVariable("room_id") int room_id, HttpSession httpSession, Model model) {

        PencariKost pencariKost = (PencariKost) httpSession.getAttribute("LOGGED_USER");

        Response roomResponse = roomService.getRoomById(room_id);
        Room room = (Room) roomResponse.getData();

        // If room is not booked yet
        if (room.isBooked() == false) {

            try { // If the booking object were already exist
                
                Response response = bookingService.getBookingByRoom(room);
                Booking booking = (Booking) response.getData();

                bookingService.setBookingPencariKost(booking.getBooking_id(), pencariKost);

                return "redirect:/booking/" + booking.getBooking_id();
            }
            catch (NoSuchElementException e) { // If there were no booking object exist

                PaymentRequest paymentRequest = new PaymentRequest();
                paymentRequest.setDateIssued(null);
                paymentRequest.setMethod(null);
                paymentRequest.setAmount(0);
                paymentRequest.setStatus("awaiting payment");
                paymentRequest.setPencariKost(pencariKost);
                paymentRequest.setPemilikKost(room.getKost().getPemilikKost());
                paymentRequest.setAdmin(null);
                Response paymentResponse = paymentService.addPayment(paymentRequest);
                Payment payment = (Payment) paymentResponse.getData();

                BookingRequest bookingRequest = new BookingRequest();
                bookingRequest.setEntryDate(null);
                bookingRequest.setExitDate(null);
                bookingRequest.setPencariKost(pencariKost);
                bookingRequest.setPayment(payment);
                bookingRequest.setRoom(room);

                Response bookingResponse = bookingService.addBooking(bookingRequest);
                Booking booking = (Booking) bookingResponse.getData();
        
                return "redirect:/booking/" + booking.getBooking_id();
            }

            
        }
        else {
            model.addAttribute("message", "room already booked");
            return "unexpectedError";
        }

    }
    
}
