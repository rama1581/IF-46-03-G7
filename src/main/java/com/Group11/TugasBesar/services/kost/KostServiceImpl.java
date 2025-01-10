package com.Group11.TugasBesar.services.kost;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

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
        kost.setPrice(request.getPrice() != null ? request.getPrice() : 0L); // Harga default 0 jika tidak ada
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
    @Override
public List<Kost> searchKost(String query, Boolean allowedMale, Boolean allowedFemale) {
    // Ambil semua kost yang approved
    List<Kost> kosts = kostRepository.findByApprovedTrue();

    // Debugging input parameters
    System.out.println("Search Query: " + query);
    System.out.println("Allowed Male: " + allowedMale);
    System.out.println("Allowed Female: " + allowedFemale);

    // Filter berdasarkan keyword (query)
    if (query != null && !query.trim().isEmpty()) {
        kosts = kosts.stream()
                     .filter(kost -> kost.getName().toLowerCase().contains(query.toLowerCase()))
                     .collect(Collectors.toList());
    }

    // Filter berdasarkan allowedMale
    if (Boolean.TRUE.equals(allowedMale)) {
        kosts = kosts.stream()
                     .filter(Kost::isAllowedMale)
                     .collect(Collectors.toList());
    }

    // Filter berdasarkan allowedFemale
    if (Boolean.TRUE.equals(allowedFemale)) {
        kosts = kosts.stream()
                     .filter(Kost::isAllowedFemale)
                     .collect(Collectors.toList());
    }

    // Filter campuran (allowedMale=true dan allowedFemale=true)
    if (Boolean.TRUE.equals(allowedMale) && Boolean.TRUE.equals(allowedFemale)) {
        kosts = kosts.stream()
                     .filter(kost -> kost.isAllowedMale() && kost.isAllowedFemale())
                     .collect(Collectors.toList());
    }

    // Debugging output
    System.out.println("Filtered Kosts: " + kosts);

    return kosts;
}


    @Override
    public List<Kost> searchMixedKost() {
    // Ambil semua kost yang memiliki allowedMale dan allowedFemale bernilai true
    return kostRepository.findByAllowedMaleTrueAndAllowedFemaleTrue();
}

    @Override
    public Response updateKost(Kost kost) {
    Kost updatedKost = kostRepository.save(kost);

    Response response = new Response();
    response.setStatus(HttpStatus.OK.value());
    response.setMessage("Kost updated successfully!");
    response.setData(updatedKost);

    return response;
}

    @Override
    public List<Kost> searchKostByPriceRange(long minPrice, long maxPrice) {
    // Ambil semua kost yang approved
    List<Kost> kosts = kostRepository.findByApprovedTrue();

    // Filter berdasarkan rentang harga
    return kosts.stream()
                .filter(kost -> kost.getPrice() >= minPrice && kost.getPrice() <= maxPrice)
                .collect(Collectors.toList());
}

    @Override
    public long getBalanceByPemilikKostId(int pemilikKostId) {
    // Ambil semua Kost milik PemilikKost tertentu
    List<Kost> kosts = kostRepository.findByPemilikKostId(pemilikKostId);

    // Hitung total balance dari semua kost
    return kosts.stream()
                .filter(kost -> kost.getPrice() != null) // Pastikan harga ada
                .mapToLong(Kost::getPrice) // Ambil harga kost
                .sum();
}

}

