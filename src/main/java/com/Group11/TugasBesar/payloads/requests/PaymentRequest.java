package com.Group11.TugasBesar.payloads.requests;

import java.util.Date;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;

public class PaymentRequest {

    private Date dateIssued;
    private String method;
    private long amount;
    private String status;
    private PencariKost pencariKost;
    private PemilikKost pemilikKost;
    private Admin admin;
    
    public PaymentRequest() {
    }

    public PaymentRequest(Date dateIssued, String method, long amount, String status, PencariKost pencariKost,
            PemilikKost pemilikKost, Admin admin) {
        this.dateIssued = dateIssued;
        this.method = method;
        this.amount = amount;
        this.status = status;
        this.pencariKost = pencariKost;
        this.pemilikKost = pemilikKost;
        this.admin = admin;
    }

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

    
    
}
