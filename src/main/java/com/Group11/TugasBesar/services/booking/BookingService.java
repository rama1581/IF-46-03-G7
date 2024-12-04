package com.Group11.TugasBesar.services.booking;

import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.Room;
import com.Group11.TugasBesar.payloads.requests.BookingRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface BookingService {

    Response addBooking(BookingRequest bookingRequest);

    Response updateBookingById(int booking_id, BookingRequest bookingRequest);

    Response setBookingPaymentStatus(int booking_id, String paymentStatus);

    Response setBookingPencariKost(int booking_id, PencariKost pencariKost);

    Response getBookings();

    Response getBookingById(int booking_id);

    Response getBookingByRoom(Room room);

    Response getBookingByPencariKost(PencariKost pencariKost);

    Response deleteBookingById(int booking_id);
    
}
