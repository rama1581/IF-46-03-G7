package com.Group11.TugasBesar.services.book;

import com.Group11.TugasBesar.payloads.requests.BookRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface BookService {
  Response addBook(BookRequest request);

  Response getBooks();

  Response getBookById(String uuid);

  Response updateBookById(String uuid, BookRequest request);

  Response deleteBookById(String uuid);
}
