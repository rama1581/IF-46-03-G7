package com.Group11.TugasBesar.repositories;

import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.Notification;
import com.Group11.TugasBesar.models.PencariKost;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;


@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer>{

    List<Notification> findByPencariKost(PencariKost pencariKost);
    
}
