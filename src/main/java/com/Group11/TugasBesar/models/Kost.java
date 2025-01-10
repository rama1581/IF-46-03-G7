package com.Group11.TugasBesar.models;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "kost")
public class Kost {
    @Id
    @Column
    @GeneratedValue
    private int kost_id;

    @Column
    private String name;

    @Column
    private String address;

    @Column
    private boolean approved;

    @Column
    private boolean allowedMale;

    @Column
    private boolean allowedFemale;

    @Column(name = "type")
    private String type;

    public String getType() {
    return type;
    }

    public void setType(String type) {
    this.type = type;
    }

    @Column
    private String imageUrl;

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    
    @Column
    private Long price;

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        if (price == null || price < 0) {
            throw new IllegalArgumentException("Harga tidak boleh null atau negatif");
        }
        this.price = price;
    }
    

    @Column

    public Double getDiscountPrice() {
        if (this.price != null) {
            return this.price * 0.5; // Diskon 50%
        }
        return 0.0; // Diskon 0 jika harga tidak ada
    }    

    @ManyToOne
    @JoinColumn(name = "pemilikKost_id")
    private PemilikKost pemilikKost;

    @OneToMany(mappedBy = "kost")
    private List<Room> rooms;

    public Kost() {}

    public Kost(String name, String address, boolean allowedMale, boolean allowedFemale) {
        this.name = name;
        this.address = address;
        this.allowedMale = allowedMale;
        this.allowedFemale = allowedFemale;
    }

    public int getKost_id() {return kost_id;}

    public void setKost_id(int kost_id) {this.kost_id = kost_id;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

    public String getAddress() {return address;}

    public void setAddress(String address) {this.address = address;}

    public boolean isApproved() {return approved;}

    public void setApproved(boolean approved) {this.approved = approved;}

    public boolean isAllowedMale() {return allowedMale;}

    public void setAllowedMale(boolean allowedMale) {this.allowedMale = allowedMale;}

    public boolean isAllowedFemale() {return allowedFemale;}

    public void setAllowedFemale(boolean allowedFemale) {this.allowedFemale = allowedFemale;}

    public PemilikKost getPemilikKost() {return pemilikKost;}

    public void setPemilikKost(PemilikKost pemilikKost) {this.pemilikKost = pemilikKost;}

    public List<Room> getRooms() {return rooms;}

    public void setRooms(List<Room> rooms) {this.rooms = rooms;}
}
