package com.Group11.TugasBesar.services.kost;

import java.util.List;

import com.Group11.TugasBesar.models.Kost;
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

    Response updateKost(Kost kost);

    // Response getKostByName(String name);
    List<Kost> searchKost(String query, Boolean allowedMale, Boolean allowedFemale);
    List<Kost> searchMixedKost();
    List<Kost> searchKostByPriceRange(long minPrice, long maxPrice);
    long getBalanceByPemilikKostId(int pemilikKostId);
}
