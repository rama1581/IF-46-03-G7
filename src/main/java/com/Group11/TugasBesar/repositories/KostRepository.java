package com.Group11.TugasBesar.repositories;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.PemilikKost;

@Repository
public interface KostRepository extends JpaRepository<Kost, Integer>{
    
    Optional<Kost> findByName(String name);

    List<Kost> findByApproved(boolean approved);

    List<Kost> findByPemilikKost(PemilikKost pemilikKost);
}
