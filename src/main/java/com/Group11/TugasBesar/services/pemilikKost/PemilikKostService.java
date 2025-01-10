package com.Group11.TugasBesar.services.pemilikKost;

import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.payloads.requests.UserRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface PemilikKostService {

	Response addPemilikKost(UserRequest request);

	Response getPemilikKost();

	Response transferToPemilikKost(Payment payment);

	long getBalanceByPemilikKostId(int pemilikKostId);


	// Response getPemilikKostByName(String name);
}
