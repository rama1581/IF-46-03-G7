package com.Group11.TugasBesar.models;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class PemilikKost {
    @Id
    @GeneratedValue
    @Column(name = "pemilikKost_id")
    private int PemilikKost_id;

    @JsonIgnore
    @OneToOne(mappedBy = "pemilikKost")
    private User user;

    @JsonIgnore
    @OneToMany(mappedBy = "pemilikKost")
    private List<Kost> kosts = new ArrayList<>();

    public PemilikKost() {}

    public PemilikKost(int PemilikKost_id) {
        this.PemilikKost_id = PemilikKost_id;
    }

    public void setPemilikKost_id(int PemilikKost_id) {this.PemilikKost_id = PemilikKost_id;}

    public int getPemilikKost_id() {return this.PemilikKost_id;}

    public List<Kost> getKosts() {
        return kosts;
    }

    public void setKosts(List<Kost> kosts) {
        this.kosts = kosts;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "balance")
    private Long balance = 0L;

    public Long getBalance() {
        return balance;
    }

    public void setBalance(Long balance) {
        this.balance = balance;
    }

    public void addBalance(Long amount) {
        if (this.balance == null) {
            this.balance = 0L; // Inisialisasi jika null
        }
        this.balance += amount; // Tambahkan saldo
    }    
}
