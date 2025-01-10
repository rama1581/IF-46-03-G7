package com.Group11.TugasBesar.services.room;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.Room;
import com.Group11.TugasBesar.payloads.requests.RoomRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.RoomRepository;

@Service
public class RoomServiceImpl implements RoomService{
    
    @Autowired
    private RoomRepository roomRepository;

    @Override
    public Response addRoom(RoomRequest request) {

        Room room = new Room();
        room.setPrice(request.getPrice());
        room.setDescription(request.getDescription());
        room.setBooked(request.isBooked());
        room.setKost(request.getKost());
        room = roomRepository.save(room);

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Kost created successfully!");
		response.setData(room);

        return response;
    }

    @Override
    public Response editRoomById(int room_id, RoomRequest roomRequest) {

        Room room = roomRepository.findById(room_id).orElseThrow(() -> {
            throw new NoSuchElementException("Room is not found");
        });

        room.setBooked(roomRequest.isBooked());
        room.setDescription(roomRequest.getDescription());
        room.setKost(roomRequest.getKost());
        room.setPrice(roomRequest.getPrice());
        room = roomRepository.save(room);

        Response response = new Response();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Room successfully edited");
        response.setData(room);

        return response;
    }

    @Override
    public Response setRoomBooking(int room_id, boolean booked) {

        Room room = roomRepository.findById(room_id).orElseThrow(() -> {
            throw new NoSuchElementException("Room is not found");
        });

        room.setBooked(booked);
        room = roomRepository.save(room);

        Response response = new Response();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage(booked ? "Room successfully booked" : "Room successfully un-booked");
        response.setData(room);

        return response;
    }

    @Override
    public Response getRoomById(int id) {

        Room room = roomRepository.findById(id).orElseThrow(() -> {
            throw new NoSuchElementException("Room is not found");
        });
        
        Response response = new Response();
        response.setStatus(HttpStatus.FOUND.value());
        response.setMessage("Room was found");
        response.setData(room);

        return response;
    }

    @Override
    public Response getRooms() {
        List<Room> rooms = roomRepository.findAll();

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Success!");
		response.setData(rooms);

        return response;
    }

    @Override
    public Response getRoomByKost(Kost kost) {

        List<Room> rooms = roomRepository.findByKost(kost);

        // List<Kost> kosts = kostRepository.findByPemilikKost(pemilikKost);

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Room was found!");
		response.setData(rooms);

        return response;
    }

    @Override
    public Response getRoomByBooked(boolean booked) {
        List<Room> rooms = roomRepository.findByBooked(booked);

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Room was found!");
		response.setData(rooms);

        return response;
    }

    // Implementasi metode getRoomsByType
    @Override
    public Response getRoomsByType(String type) {
        List<Room> rooms = roomRepository.findByType(type); // Menggunakan query di repository untuk menemukan kamar berdasarkan tipe

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Rooms found!");
        response.setData(rooms);

        return response;
    }

    @Override
    public Response updateRoom(Room room) {
    try {
        Room updatedRoom = roomRepository.save(room); // Simpan perubahan ke database
        Response response = new Response();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Room updated successfully!");
        response.setData(updatedRoom);
        return response;
    } catch (Exception e) {
        throw new RuntimeException("Failed to update Room: " + e.getMessage());
    }
}

}
