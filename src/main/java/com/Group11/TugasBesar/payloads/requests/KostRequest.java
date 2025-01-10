package com.Group11.TugasBesar.payloads.requests;

import com.Group11.TugasBesar.models.PemilikKost;

public class KostRequest {
    private String name;
    private String address;
    private boolean allowedMale;
    private boolean allowedFemale;
    private boolean approved; 
    private PemilikKost pemilikKost;
    private long price;

    public KostRequest() {}

    public KostRequest(String name, String address, boolean allowedMale, boolean allowedFemale, PemilikKost pemilikKost) {
        this.name = name;
        this.address = address;
        this.allowedMale = allowedMale;
        this.allowedFemale = allowedFemale;
        this.pemilikKost = pemilikKost;
    }

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }

    public Long getPrice() {
        return price;
    }
    
    public void setPrice(Long price) {
        this.price = price;
    }
    
    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

    public String getAddress() {return address;}

    public void setAddress(String address) {this.address = address;}

    public boolean isAllowedMale() {return allowedMale;}

    public void setAllowedMale(boolean allowedMale) {this.allowedMale = allowedMale;}

    public boolean isAllowedFemale() {return allowedFemale;}

    public void setAllowedFemale(boolean allowedFemale) {this.allowedFemale = allowedFemale;}

    public PemilikKost getPemilikKost() {return pemilikKost;}

    public void setPemilikKost(PemilikKost pemilikKost) {this.pemilikKost = pemilikKost;}

    
}
