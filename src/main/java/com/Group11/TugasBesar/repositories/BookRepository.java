package com.Group11.TugasBesar.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Group11.TugasBesar.models.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {

}