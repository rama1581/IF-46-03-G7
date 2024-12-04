package com.Group11.TugasBesar.services.pencariKost;

import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface PencariKostService {

	Response addPencariKost(UserRequest request);

	Response getPencariKosts();

	// Response getPencariKostByName(String name);
}
