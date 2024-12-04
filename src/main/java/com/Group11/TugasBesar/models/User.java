package com.Group11.TugasBesar.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "user")
public class User {
    @Id
    @Column(name = "user_id")
    @GeneratedValue
    private int user_id;

    @Column(name = "username")
    private String username;

    @Column(name = "phoneNumber")
    private Long phoneNumber;

    @Column(name = "email")
    private String email;
    
    @Column(name = "password")
    private String password;

    @OneToOne(orphanRemoval = true)
    @JoinColumn(name = "admin_id", referencedColumnName = "admin_id")
    private Admin admin;

    @OneToOne(orphanRemoval = true)
    @JoinColumn(name = "pencariKost_id", referencedColumnName = "pencariKost_id")
    private PencariKost pencariKost;

    @OneToOne(orphanRemoval = true)
    @JoinColumn(name = "pemilikKost_id", referencedColumnName = "pemilikKost_id")
    private PemilikKost pemilikKost;
    
    public User() {}

    public User(String username, Long phoneNumber, String email, String password) {
        this.username = username;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
    }

    public int getId() {return this.user_id;}

    public String getUsername() {return this.username;}
    
    public Long getPhoneNumber() {return this.phoneNumber;}

    public String getEmail() {return this.email;}

    public String getPassword() {return this.password;}

    public Admin getAdmin() {return this.admin;}

    public PencariKost getPencariKost() {return this.pencariKost;}

    public PemilikKost getPemilikKost() {return this.pemilikKost;}

    public void setId(int user_id) {this.user_id = user_id;}

    public void setUsername(String username) {this.username = username;}

    public void setPhoneNumber(Long phoneNumber) {this.phoneNumber = phoneNumber;}

    public void setEmail(String email) {this.email = email;}
    
    public void setPassword(String password) {this.password = password;}

    public void setAdmin(Admin admin) {this.admin = admin;}

    public void setPencariKost(PencariKost pencariKost) {this.pencariKost = pencariKost;}

    public void setPemilikKost(PemilikKost pemilikKost) {this.pemilikKost = pemilikKost;}
  }
