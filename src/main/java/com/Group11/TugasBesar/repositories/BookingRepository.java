package com.Group11.TugasBesar.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

import com.Group11.TugasBesar.models.Booking;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.Room;

public interface BookingRepository extends JpaRepository<Booking, Integer>{
    
    Optional<Booking> findByRoom(Room room);

    List<Booking> findByPencariKost(PencariKost pencariKost);
}
