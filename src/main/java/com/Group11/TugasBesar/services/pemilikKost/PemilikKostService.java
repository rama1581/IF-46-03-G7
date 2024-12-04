package com.Group11.TugasBesar.services.pemilikKost;

import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface PemilikKostService {

	Response addPemilikKost(UserRequest request);

	Response getPemilikKost();

	// Response getPemilikKostByName(String name);
}
