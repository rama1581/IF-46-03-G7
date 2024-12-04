package com.Group11.TugasBesar.services.book;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Book;
import com.Group11.TugasBesar.payloads.requests.BookRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.BookRepository;

@Service
public class BookServiceImpl implements BookService {
  @Autowired
  private BookRepository bookRepository;

  @Override
  public Response addBook(BookRequest request) {
    // Buat object entitas buku
    Book book = new Book();

    // Transfer data from request to entity
    book.setTitle(request.getJudul());
    book.setAuthor(request.getPengarang());
    book.setPublisher(request.getPenerbit());
    book.setIsbn(request.getIsbn());
    book.setYear(request.getTahunTerbit());

    // Simpan entitas buku dengan repository
    book = bookRepository.save(book);

    // Buat object Response
    Response response = new Response();
    response.setStatus(HttpStatus.CREATED.value());
    response.setMessage("Book created successfully!");
    response.setData(book);

    // Return object response
    return response;
  }

  @Override
  public Response getBooks() {
    // Buat object list buku yang diisi dari repository find all
    List<Book> books = bookRepository.findAll();

    // Buat object response
    Response response = new Response(HttpStatus.OK.value(), "success", books);
    return response;
  }

  @Override
  public Response getBookById(String uuid) {
    // Buat object buku yang dicari berdasarkan id
    Book book = bookRepository.findById(uuid).orElseThrow(() -> {
      throw new NoSuchElementException("Book is not found!");
    });

    return new Response(HttpStatus.OK.value(), "success", book);
  }

  @Override
  public Response updateBookById(String uuid, BookRequest request) {
    // Cari buku yang mau diperbarui berdasarkan id
    Book book = bookRepository.findById(uuid).orElseThrow(() -> {
      throw new NoSuchElementException("Book is not found!");
    });

    // Perbarui data dengan request yang baru
    book.setTitle(request.getJudul());
    book.setAuthor(request.getPengarang());
    book.setPublisher(request.getPenerbit());
    book.setYear(request.getTahunTerbit());
    book.setIsbn(request.getIsbn());

    // Simpan buku
    book = bookRepository.save(book);

    return new Response(HttpStatus.OK.value(), "success updated", book);
  }

  @Override
  public Response deleteBookById(String uuid) {
    // Cari buku yang mau diperbarui berdasarkan id
    Book book = bookRepository.findById(uuid).orElseThrow(() -> {
      throw new NoSuchElementException("Book is not found!");
    });

    // Hapus buku dengan mengubah status is deleted menjadi true
    book.setIsDeleted(true);

    // Simpan buku
    book = bookRepository.save(book);

    return new Response(HttpStatus.OK.value(), "success deleted", null);
  }

}