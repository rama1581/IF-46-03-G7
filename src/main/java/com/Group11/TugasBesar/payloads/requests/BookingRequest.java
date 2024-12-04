package com.Group11.TugasBesar.payloads.requests;

import java.util.Date;

import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.Room;

public class BookingRequest {

    private Date entryDate;
    private Date exitDate;
    private Date expireTime;
    private PencariKost pencariKost;
    private Room room;
    private Payment payment;

    public BookingRequest() {}

    public BookingRequest(Date entryDate, Date exitDate, Date expireTime, Room room, PencariKost pencariKost, Payment payment) {
        this.entryDate = entryDate;
        this.exitDate = exitDate;
        this.expireTime = expireTime;
        this.room = room;
        this.pencariKost = pencariKost;
        this.payment = payment;
    }

    public Date getEntryDate() {return entryDate;}

    public void setEntryDate(Date entryDate) {this.entryDate = entryDate;}

    public Date getExitDate() {return exitDate;}

    public void setExitDate(Date exitDate) {this.exitDate = exitDate;}

    public PencariKost getPencariKost() {return pencariKost;}

    public void setPencariKost(PencariKost pencariKost) {this.pencariKost = pencariKost;}

    public Room getRoom() {return room;}

    public void setRoom(Room room) {this.room = room;}

    public Date getExpireTime() {return expireTime;}

    public void setExpireTime(Date expireTime) { this.expireTime = expireTime;}

    public Payment getPayment() {return payment;}

    public void setPayment(Payment payment) {this.payment = payment;}
}
