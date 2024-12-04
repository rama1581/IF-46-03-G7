package com.Group11.TugasBesar.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "Payment")
public class Payment {

    @Id
    @Column
    @GeneratedValue
    private int payment_id;

    @Column
    private Date dateIssued;

    @Column
    private String method;

    @Column
    private long amount;

    @Column
    private String status;

    @ManyToOne
    @JoinColumn(name = "pencariKost_id")
    private PencariKost pencariKost;

    @ManyToOne
    @JoinColumn(name = "pemilikKost_id")
    private PemilikKost pemilikKost;

    @ManyToOne
    @JoinColumn(name = "admin_id")
    private Admin admin;

    @OneToOne(mappedBy = "payment", cascade = CascadeType.ALL)
    private Booking booking;

    public Payment() {}

    public Payment(int payment_id, Date dateIssued, String method, long amount, String status, PencariKost pencariKost,
            PemilikKost pemilikKost, Admin admin, Booking booking) {
        this.payment_id = payment_id;
        this.dateIssued = dateIssued;
        this.method = method;
        this.amount = amount;
        this.status = status;
        this.pencariKost = pencariKost;
        this.pemilikKost = pemilikKost;
        this.admin = admin;
        this.booking = booking;
    }

    public int getPayment_id() {return payment_id;}

    public void setPayment_id(int payment_id) {this.payment_id = payment_id;}

    public Date getDateIssued() {return dateIssued;}

    public void setDateIssued(Date dateIssued) {this.dateIssued = dateIssued;}

    public String getMethod() {return method;}

    public void setMethod(String method) {this.method = method;}

    public long getAmount() {return amount;}

    public void setAmount(long amount) {this.amount = amount;}

    public String getStatus() {return status;}

    public void setStatus(String status) {this.status = status;}

    public PencariKost getPencariKost() {return pencariKost;}

    public void setPencariKost(PencariKost pencariKost) {this.pencariKost = pencariKost;}

    public PemilikKost getPemilikKost() {return pemilikKost;}

    public void setPemilikKost(PemilikKost pemilikKost) {this.pemilikKost = pemilikKost;}

    public Admin getAdmin() {return admin;}

    public void setAdmin(Admin admin) {this.admin = admin;}

    public Booking getBooking() {return booking;}

    public void setBooking(Booking booking) {this.booking = booking;}
    
    
}
