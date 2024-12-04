package com.Group11.TugasBesar.payloads.requests;

import com.Group11.TugasBesar.models.PemilikKost;

public class KostRequest {
    private String name;
    private String address;
    private boolean allowedMale;
    private boolean allowedFemale;
    private PemilikKost pemilikKost;

    public KostRequest() {}

    public KostRequest(String name, String address, boolean allowedMale, boolean allowedFemale, PemilikKost pemilikKost) {
        this.name = name;
        this.address = address;
        this.allowedMale = allowedMale;
        this.allowedFemale = allowedFemale;
        this.pemilikKost = pemilikKost;
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
