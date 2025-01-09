package com.Group11.TugasBesar.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.PemilikKost;

@Repository
public interface KostRepository extends JpaRepository<Kost, Integer>{
    
    Optional<Kost> findByName(String name);

    List<Kost> findByApproved(boolean approved);

    List<Kost> findByPemilikKost(PemilikKost pemilikKost);

    List<Kost> findByAllowedMaleAndAllowedFemale(boolean allowedMale, boolean allowedFemale);

      // Mencari berdasarkan nama dan filter allowedMale/allowedFemale
    List<Kost> findByNameContainingIgnoreCase(String name);
    List<Kost> findByApprovedTrue();

    List<Kost> findByAllowedMaleTrueAndAllowedFemaleTrue();
    @Query("SELECT k FROM Kost k WHERE k.pemilikKost.PemilikKost_id = :pemilikKostId")
    List<Kost> findByPemilikKostId(@Param("pemilikKostId") int pemilikKostId);
}

