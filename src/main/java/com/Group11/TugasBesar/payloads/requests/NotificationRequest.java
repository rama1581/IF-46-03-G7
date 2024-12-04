package com.Group11.TugasBesar.payloads.requests;

import java.util.Date;

import com.Group11.TugasBesar.models.PencariKost;

public class NotificationRequest {

    private String message;
    private Date notifyTime;
    private PencariKost pencariKost;

    public NotificationRequest() {}

    public NotificationRequest(String message, Date notifyTime, PencariKost pencariKost) {
        this.message = message;
        this.notifyTime = notifyTime;
        this.pencariKost = pencariKost;
    }

    public String getMessage() {return message;}

    public void setMessage(String message) {this.message = message;}

    public Date getNotifyTime() {return notifyTime;}

    public void setNotifyTime(Date notifyTime) {this.notifyTime = notifyTime;}

    public PencariKost getPencariKost() {return pencariKost;}

    public void setPencariKost(PencariKost pencariKost) {this.pencariKost = pencariKost;}

}
