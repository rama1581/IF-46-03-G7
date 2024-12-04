package com.Group11.TugasBesar.services.admin;

import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface AdminService {

	Response addAdmin(UserRequest request);

	Response getAdmin();
}
