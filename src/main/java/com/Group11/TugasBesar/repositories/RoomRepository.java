package com.Group11.TugasBesar.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, Integer>{
    
    List<Room> findByKost(Kost kost);

    List<Room> findByBooked(boolean booked);

    List<Room> findByType(String type);
}
