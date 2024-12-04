package com.Group11.TugasBesar.services.kost;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Kost;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.payloads.requests.KostRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.KostRepository;

@Service
public class KostServiceImpl implements KostService{
    
    @Autowired
    private KostRepository kostRepository;

    @Override
    public Response addKost(KostRequest request) {

        Kost kost = new Kost();
        kost.setName(request.getName());
        kost.setAddress(request.getAddress());
        kost.setAllowedMale(request.isAllowedMale());
        kost.setAllowedFemale(request.isAllowedFemale());
        kost.setPemilikKost(request.getPemilikKost());
        kost = kostRepository.save(kost);
        
        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Kost created successfully!");
		response.setData(kost);

        return response;
    }

    @Override
    public Response setKostApproved(int kost_id, boolean approved) {
        Kost kost = kostRepository.findById(kost_id).orElseThrow(() -> {
            throw new NoSuchElementException("Kost is not found!");
        });

        kost.setApproved(approved);
        kost = kostRepository.save(kost);

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Kost approved successfully changed!");
		response.setData(kost);

        return response;
    }

    @Override
    public Response getKosts() {
        List<Kost> kosts = kostRepository.findAll();

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Success!");
		response.setData(kosts);

        return response;
    }

    @Override
    public Response getKostById(int id) {
        Kost kost = kostRepository.findById(id).orElseThrow(() -> {
            throw new NoSuchElementException("Kost is not found!");
        });

        Response response = new Response();
        response.setStatus(HttpStatus.FOUND.value());
        response.setMessage("Kost was found");
        response.setData(kost);
        
        return response;
    }

    @Override
    public Response getKostByName(String name) {
        Kost kost = kostRepository.findByName(name).orElseThrow(() -> {
            throw new NoSuchElementException("Kost is not found!");
        });

        Response response = new Response();
        response.setStatus(HttpStatus.FOUND.value());
        response.setMessage("Kost was found");
        response.setData(kost);
        
        return response;
    }

    @Override
    public Response getKostByApproved(boolean approved) {
        List<Kost> kosts = kostRepository.findByApproved(approved);

        Response response = new Response();
        response.setStatus(HttpStatus.FOUND.value());
        response.setMessage("Kost was found");
        response.setData(kosts);
        
        return response;
    }
    
    @Override
    public Response getKostByPemilikKost(PemilikKost pemilikKost) {

        List<Kost> kosts = kostRepository.findByPemilikKost(pemilikKost);

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Success!");
		response.setData(kosts);

        return response;
    }
}
