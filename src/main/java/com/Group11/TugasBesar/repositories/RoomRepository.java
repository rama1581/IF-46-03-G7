package com.Group11.TugasBesar.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, Integer>{
    
    List<Room> findByKost(Kost kost);

    List<Room> findByBooked(boolean booked);
}
