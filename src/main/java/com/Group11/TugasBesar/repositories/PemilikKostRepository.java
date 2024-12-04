package com.Group11.TugasBesar.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.PemilikKost;

@Repository
public interface PemilikKostRepository extends JpaRepository<PemilikKost, Integer>{
    
    // Optional<PemilikKost> findByName(String name);
    
}
