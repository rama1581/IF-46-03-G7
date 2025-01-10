package com.Group11.TugasBesar.services.user;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.LoginRequest;
import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface UserService {
  Response addUser(UserRequest request);

  Response addPencariKost(UserRequest request);

  Response addPemilikKost(UserRequest request);

  Response addAdmin(UserRequest request);

  Response getUsers();

  Response getUserByUsername(String username);

  Response getUserByEmail(String email);

  Response getUserByPencariKost(PencariKost pencariKost);

  Response getUserByPemilikKost(PemilikKost pemilikKost);

  Response getUserByAdmin(Admin admin);

  Response login(LoginRequest loginRequest);

  Response updateUser(User user);
}
