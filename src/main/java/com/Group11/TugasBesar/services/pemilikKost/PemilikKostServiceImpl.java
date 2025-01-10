package com.Group11.TugasBesar.services.pemilikKost;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.PemilikKostRepository;
import com.Group11.TugasBesar.repositories.UserRepository;
import com.Group11.TugasBesar.services.user.UserService;

@Service
public class PemilikKostServiceImpl implements PemilikKostService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserService userService;
	
	@Autowired
	private PemilikKostRepository pemilikKostRepository;

	@Override
	public Response addPemilikKost(UserRequest request) {

		try {
			Response response = userService.getUserByEmail(request.getEmail());

			response = new Response();
			response.setStatus(HttpStatus.CONFLICT.value());
			response.setMessage("User already exist!");
			response.setData(null);

			return response;
		} catch (NoSuchElementException e) {

			User user = new User();
			PemilikKost pemilikKost = new PemilikKost();
			pemilikKost = pemilikKostRepository.save(pemilikKost);

			user.setUsername(request.getUsername());
			user.setPhoneNumber(request.getPhoneNumber());
			user.setEmail(request.getEmail());
			user.setPassword(request.getPassword());
			user.setPemilikKost(pemilikKost);
			user = userRepository.save(user);

			Response response = new Response();
			response.setStatus(HttpStatus.CREATED.value());
			response.setMessage("User created successfully!");
			response.setData(user);

			return response;
		} catch (Exception e) {
			Response response = new Response();
			response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
			response.setMessage("Internal Server Error");
			response.setData(null);
			return response;
		}
	}

	@Override
  	public Response getPemilikKost() {
		List<PemilikKost> pemilikKosts = pemilikKostRepository.findAll();

		Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("User created successfully!");
		response.setData(pemilikKosts);
		return response;
	}

  	// public Response getPemilikKostByName(String name) {
	// 	PemilikKost pemilikKost = pemilikKostRepository.findByName(name).orElseThrow(() -> {
	// 		throw new NoSuchElementException("User is not found!");
	// 		});

	// 	Response response = new Response();
	// 	response.setStatus(HttpStatus.CREATED.value());
	// 	response.setMessage("User created successfully!");
	// 	response.setData(pemilikKost);
	// 	return response;
	// }

	@Override
	public Response transferToPemilikKost(Payment payment) {
    if (payment == null || payment.getPemilikKost() == null) {
        return new Response(HttpStatus.BAD_REQUEST.value(), "Payment atau Pemilik Kost tidak valid!", null);
    }

    PemilikKost pemilikKost = payment.getPemilikKost();

    // Ambil saldo saat ini
    Long currentBalance = pemilikKost.getBalance() != null ? pemilikKost.getBalance() : 0L;

    // Update saldo dengan jumlah pembayaran
    pemilikKost.setBalance(currentBalance + payment.getAmount());
    pemilikKostRepository.save(pemilikKost); // Simpan ke database

    System.out.println("Saldo berhasil diupdate untuk Pemilik Kost ID: " + pemilikKost.getPemilikKost_id());

    return new Response(HttpStatus.OK.value(), "Saldo berhasil ditransfer!", pemilikKost);
}


@Override
    public long getBalanceByPemilikKostId(int pemilikKostId) {
        return pemilikKostRepository.findBalanceByPemilikKostId(pemilikKostId);
    }

}
