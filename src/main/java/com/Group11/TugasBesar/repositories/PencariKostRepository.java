package com.Group11.TugasBesar.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.PencariKost;

@Repository
public interface PencariKostRepository extends JpaRepository<PencariKost, Integer>{
    
    // Optional<PencariKost> findByName(String name);

}
