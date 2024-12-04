package com.Group11.TugasBesar.payloads.requests;

import com.Group11.TugasBesar.models.Kost;

public class RoomRequest {
    private long price;
    private String description;
    private boolean booked;
    private Kost kost;

    public RoomRequest() {}

    public RoomRequest(long price, String description, boolean booked, Kost kost) {
        this.price = price;
        this.description = description;
        this.booked = booked;
        this.kost = kost;
    }

    public long getPrice() {return price;}

    public void setPrice(long price) {this.price = price;}

    public String getDescription() {return description;}

    public void setDescription(String description) {this.description = description;}

    public boolean isBooked() {return booked;}

    public void setBooked(boolean booked) {this.booked = booked;}

    public Kost getKost() {return kost;}

    public void setKost(Kost kost) {this.kost = kost;}
}
