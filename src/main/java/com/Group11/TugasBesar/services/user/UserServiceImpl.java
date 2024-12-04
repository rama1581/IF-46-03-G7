package com.Group11.TugasBesar.services.user;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.LoginRequest;
import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.AdminRepository;
import com.Group11.TugasBesar.repositories.PemilikKostRepository;
import com.Group11.TugasBesar.repositories.PencariKostRepository;
import com.Group11.TugasBesar.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PencariKostRepository pencariKostRepository;

	@Autowired
	private PemilikKostRepository pemilikKostRepository;

	@Autowired
	private AdminRepository adminRepository;

	@Override
	public Response addUser(UserRequest request) {

		// System.out.println(request.getUsername());     // Debugging purposes
		// System.out.println(request.getEmail());        // Debugging purposes
		// System.out.println(request.getPassword());     // Debugging purposes
		// System.out.println(request.getPhoneNumber());  // Debugging purposes
		
		User user = new User();
		user.setUsername(request.getUsername());
		user.setPhoneNumber(request.getPhoneNumber());
		user.setEmail(request.getEmail());
		user.setPassword(request.getPassword());
		user = userRepository.save(user);

		Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("User created successfully!");
		response.setData(user);

		return response;
    }

	@Override
	public Response addPencariKost(UserRequest request) {

		User user = new User();
		PencariKost pencariKost = new PencariKost();
		pencariKost = pencariKostRepository.save(pencariKost);

		user.setUsername(request.getUsername());
		user.setPhoneNumber(request.getPhoneNumber());
		user.setEmail(request.getEmail());
		user.setPassword(request.getPassword());
		user.setPencariKost(pencariKost);
		user = userRepository.save(user);

		// int temp = user.getId();
		// Optional<User> retrievedUser = userRepository.findById(temp);
		// User editUser = retrievedUser.get();
		// editUser.setUsername("SudahDiUpdateTerimakasih");
		// userRepository.save(editUser);

		Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("User created successfully!");
		response.setData(user);

		return response;
    }

    @Override
    public Response addPemilikKost(UserRequest request) {

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
    }

    @Override
    public Response addAdmin(UserRequest request) {

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
    }

	@Override
	public Response getUsers() {

		List<User> users = userRepository.findAll();

		Response response = new Response();
		response.setStatus(HttpStatus.FOUND.value());
		response.setMessage("User created successfully!");
		response.setData(users);
		return response;
	}

	@Override
	public Response getUserByUsername(String username) {
    
		User user = userRepository.findByUsername(username).orElseThrow(() -> {
			throw new NoSuchElementException("User is not found!");
			});

		Response response = new Response();
		response.setStatus(HttpStatus.FOUND.value());
		response.setMessage("User created successfully!");
		response.setData(user);
		return response;
	}

	@Override
	public Response getUserByEmail(String email) {

		User user = userRepository.findByEmail(email).orElseThrow(() -> {
			throw new NoSuchElementException("User is not found");
		});

		Response response = new Response();
		response.setStatus(HttpStatus.FOUND.value());
		response.setMessage("User was found!");
		response.setData(user);
		return response;
	}

	@Override
	public Response getUserByPencariKost(PencariKost pencariKost) {

		List<PencariKost> pencariKosts = userRepository.findByPencariKost(pencariKost);

		Response response = new Response();
		response.setStatus(HttpStatus.FOUND.value());
		response.setMessage("User created successfully!");
		response.setData(pencariKosts);
		return response;
	}

	@Override
	public Response getUserByPemilikKost(PemilikKost pemilikKost) {
		
		List<PemilikKost> pemilikKosts = userRepository.findByPemilikKost(pemilikKost);

		Response response = new Response();
		response.setStatus(HttpStatus.FOUND.value());
		response.setMessage("User created successfully!");
		response.setData(pemilikKosts);
		return response;
	}

	@Override
	public Response getUserByAdmin(Admin admin) {
		
		List<Admin> admins = userRepository.findByAdmin(admin);

		Response response = new Response();
		response.setStatus(HttpStatus.FOUND.value());
		response.setMessage("User created successfully!");
		response.setData(admins);
		return response;
	}

	@Override
	public Response login(LoginRequest loginRequest) {

		User user = (User) getUserByEmail(loginRequest.getEmail()).getData();

		Response response = new Response();
		
		if (user.getPassword().equals(loginRequest.getPassword())) {
			response.setStatus(HttpStatus.FOUND.value());
			response.setMessage("Login request accepted!");

			response.setData(user);
		}
		else {
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			response.setMessage("Incorrect password");
			// You can choose not to set data in case of an incorrect password, or set it to null.
			// response.setData(null);
			
		}
		return response;
	}
}