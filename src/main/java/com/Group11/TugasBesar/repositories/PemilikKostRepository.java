package com.Group11.TugasBesar.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.PemilikKost;

@Repository
public interface PemilikKostRepository extends JpaRepository<PemilikKost, Integer>{
    
    // Optional<PemilikKost> findByName(String name);
    @Query(value = "SELECT balance FROM pemilik_kost WHERE pemilik_kost_id = :pemilikKostId", nativeQuery = true)
    Long findBalanceByPemilikKostId(@Param("pemilikKostId") Integer pemilikKostId);
}
