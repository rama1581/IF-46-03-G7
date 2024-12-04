package com.Group11.TugasBesar.services.kost;

import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.payloads.requests.KostRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface KostService {

    Response addKost(KostRequest request);

    Response setKostApproved(int kost_id, boolean approved);

    Response getKosts();

    Response getKostById(int id);

    Response getKostByName(String name);

    Response getKostByApproved(boolean approved);

    Response getKostByPemilikKost(PemilikKost pemilikKost);

    // Response getKostByName(String name);
    
}
