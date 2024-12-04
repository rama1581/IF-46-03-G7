package com.Group11.TugasBesar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.Group11.TugasBesar.models.Booking;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.booking.BookingService;
import com.Group11.TugasBesar.services.room.RoomService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class ScheduledTask {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private RoomService roomService;

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    // Scheduled method that runs every 1 minute
    @Scheduled(fixedRate = 60000)
    public void checkTime() {
        // Get the current time
        Date currentTime = new Date();
        System.out.println("Checking time at " + dateFormat.format(currentTime));

        Response response = bookingService.getBookings();
        List<Booking> bookings = (List<Booking>) response.getData();

        // Compare the current time with the record time

        for(Booking booking : bookings ) {
            if (currentTime.after(booking.getExitDate())) {
                bookingService.deleteBookingById(booking.getBooking_id());
                roomService.setRoomBooking(booking.getRoom().getRoom_id(), false);
            }
        }
    }
}
