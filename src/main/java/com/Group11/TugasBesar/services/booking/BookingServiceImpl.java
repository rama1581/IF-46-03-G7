package com.Group11.TugasBesar.services.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import com.Group11.TugasBesar.models.Booking;
import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.Room;
import com.Group11.TugasBesar.payloads.requests.BookingRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.BookingRepository;
import com.Group11.TugasBesar.repositories.PaymentRepository;

@Service
public class BookingServiceImpl implements BookingService{

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @Override
    public Response addBooking(BookingRequest bookingRequest) {
        
        Booking booking = new Booking();
        booking.setEntryDate(bookingRequest.getEntryDate());
        booking.setExitDate(bookingRequest.getExitDate());
        booking.setexpireTime(bookingRequest.getExpireTime());
        booking.setRoom(bookingRequest.getRoom());
        booking.setPencariKost(bookingRequest.getPencariKost());
        booking.setPayment(bookingRequest.getPayment());
        booking = bookingRepository.save(booking);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking created successfully!");
        response.setData(booking);
        
        return response;
    }
    
    @Override
    public Response updateBookingById(int booking_id, BookingRequest bookingRequest) {
        
        Booking booking = bookingRepository.findById(booking_id).orElseThrow(() -> {
            throw new NoSuchElementException("Booking is not found!");
        });

        booking.setEntryDate(bookingRequest.getEntryDate());
        booking.setExitDate(bookingRequest.getExitDate());
        booking.setexpireTime(bookingRequest.getExpireTime());
        booking.setRoom(bookingRequest.getRoom());
        booking.setPencariKost(bookingRequest.getPencariKost());
        booking.setPayment(bookingRequest.getPayment());
        booking.setRoom(bookingRequest.getRoom());

        booking = bookingRepository.save(booking);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking successfully updated!");
        response.setData(booking);
        
        return response;
    }

    @Override
    public Response setBookingPaymentStatus(int booking_id, String paymentStatus) {

        Booking booking = bookingRepository.findById(booking_id).orElseThrow(() -> {
            throw new NoSuchElementException("Booking is not found!");
        });

        Payment payment = booking.getPayment();
        payment.setStatus(paymentStatus);
        paymentRepository.save(payment);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking successfully " + paymentStatus + "!");
        response.setData(booking);
        
        return response;
    }
    
    @Override
    public Response setBookingPencariKost(int booking_id, PencariKost pencariKost) {

        Booking booking = bookingRepository.findById(booking_id).orElseThrow(() -> {
            throw new NoSuchElementException("Booking is not found!");
        });

        booking.setPencariKost(pencariKost);
        booking = bookingRepository.save(booking);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Successfully changed booking's PemilikKost");
        response.setData(booking);
        
        return response;
    }

    @Override
    public Response getBookings() {
        
        List<Booking> bookings = bookingRepository.findAll();
        
        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking was found");
        response.setData(bookings);

        return response;
    }

    @Override
    public Response getBookingById(int booking_id) {
        Booking booking = bookingRepository.findById(booking_id).orElseThrow(() -> {
            throw new NoSuchElementException("Booking is not found!");
        });

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking was found");
        response.setData(booking);

        return response;
    }
    
    @Override
    public Response getBookingByPencariKost(PencariKost pencariKost) {
        
        List<Booking> bookings = bookingRepository.findByPencariKost(pencariKost);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking was found");
        response.setData(bookings);

        return response;
    }

    @Override
    public Response getBookingByRoom(Room room) {

        Booking booking = bookingRepository.findByRoom(room).orElseThrow(() -> {
            throw new NoSuchElementException("Booking is not found!");
        });

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking was found");
        response.setData(booking);

        return response;
    }

    @Override
    public Response deleteBookingById(int booking_id) {
        
        Booking booking = bookingRepository.findById(booking_id).orElseThrow(() -> {
            throw new NoSuchElementException("Booking is not found!");
        });

        bookingRepository.delete(booking);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Booking successfully deleted");
        response.setData(null);

        return response;
    }
}
