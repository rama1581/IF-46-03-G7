package com.Group11.TugasBesar.services.pencariKost;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.PencariKostRepository;
import com.Group11.TugasBesar.repositories.UserRepository;
import com.Group11.TugasBesar.services.user.UserService;

@Service
public class PencariKostServiceImpl implements PencariKostService{

	@Autowired
	private UserService userService;

    @Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PencariKostRepository pencariKostRepository;

	@Override
	public Response addPencariKost(UserRequest request) {
		try {
			Response response = userService.getUserByEmail(request.getEmail());

			response = new Response();
			response.setStatus(HttpStatus.CONFLICT.value());
			response.setMessage("User already exist!");
			response.setData(null);

			return response;
		} catch (NoSuchElementException e) {

			User user = new User();
			PencariKost pencariKost = new PencariKost();
			pencariKost = pencariKostRepository.save(pencariKost);

			user.setUsername(request.getUsername());
			user.setPhoneNumber(request.getPhoneNumber());
			user.setEmail(request.getEmail());
			user.setPassword(request.getPassword());
			user.setPencariKost(pencariKost);
			user = userRepository.save(user);

			pencariKost.setUser(user);
			pencariKostRepository.save(pencariKost);

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
  	public Response getPencariKosts() {
		List<PencariKost> pencariKosts = pencariKostRepository.findAll();

		Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("User created successfully!");
		response.setData(pencariKosts);
		return response;
	}
}
