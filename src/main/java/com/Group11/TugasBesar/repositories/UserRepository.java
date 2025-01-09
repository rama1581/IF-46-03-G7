package com.Group11.TugasBesar.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

    // @Query(value = "SELECT * FROM `library_db`.`user` WHERE username = :username", nativeQuery = true)
    // Optional<User> findUserByUsername(@Param("username") String username);

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);
    
    Optional<User> findById(Integer id);

    List<PencariKost> findByPencariKost(PencariKost pencariKost);

    List<PemilikKost> findByPemilikKost(PemilikKost pemilikKost);

    List<Admin> findByAdmin(Admin admin);
    
}
