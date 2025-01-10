package com.Group11.TugasBesar.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "room")
public class Room {
    @Id
    @Column
    @GeneratedValue
    private int room_id;

    @Column
    private long price;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column
    private boolean booked;

    @ManyToOne
    @JoinColumn(name = "kost_id")
    private Kost kost;

    // Menambahkan field type untuk menyimpan tipe kamar
    @Column
    private String type;  // Misalnya: "Putra", "Putri", atau "Campur"

    // Menambahkan field untuk menyimpan URL gambar
    @Column(columnDefinition = "TEXT")
    private String imageUrl;

    public Room() {}

    public Room(long price, String description, boolean booked, String type, String imageUrl) {
        this.price = price;
        this.description = description;
        this.booked = booked;
        this.type = type;
        this.imageUrl = imageUrl;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getKostId() {
        return this.kost != null ? this.kost.getKost_id() : 0; // Mengembalikan 0 jika kost null
    }    

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isBooked() {
        return booked;
    }

    public void setBooked(boolean booked) {
        this.booked = booked;
    }

    public Kost getKost() {
        return kost;
    }

    public void setKost(Kost kost) {
        this.kost = kost;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
