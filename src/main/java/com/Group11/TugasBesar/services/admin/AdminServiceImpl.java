package com.Group11.TugasBesar.services.admin;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.AdminRepository;
import com.Group11.TugasBesar.repositories.UserRepository;
import com.Group11.TugasBesar.services.user.UserService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private UserService userService;

    @Autowired
	private UserRepository userRepository;

    @Autowired
    private AdminRepository adminRepository;

	@Override
    public Response addAdmin(UserRequest request) {

		try {
			Response response = userService.getUserByEmail(request.getEmail());

			response = new Response();
			response.setStatus(HttpStatus.CONFLICT.value());
			response.setMessage("User already exist!");
			response.setData(null);

			return response;
		} catch (NoSuchElementException e) {

			User user = new User();
			Admin admin = new Admin();
			admin = adminRepository.save(admin);

			user.setUsername(request.getUsername());
			user.setPhoneNumber(request.getPhoneNumber());
			user.setEmail(request.getEmail());
			user.setPassword(request.getPassword());
			user.setAdmin(admin);
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
  	public Response getAdmin() {
		List<Admin> admins = adminRepository.findAll();

		Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("User created successfully!");
		response.setData(admins);

		return response;
	}
}
