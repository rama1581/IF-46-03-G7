package com.Group11.TugasBesar.models;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name ="notification")
public class Notification {

    @Id
    @Column
    @GeneratedValue
    private int notification_id;

    @Column(columnDefinition = "TEXT")
    private String message;

    @Column(nullable = false)
    private Date notifyTime = new Date(); // Nilai default

   @ManyToOne
    @JoinColumn(name = "pencariKost_id")
    @JsonBackReference
    private PencariKost pencariKost;

    public Notification() {
    }

    public Notification(int notification_id, String message, Date notifyTime, PencariKost pencariKost) {
        this.notification_id = notification_id;
        this.message = message;
        this.notifyTime = notifyTime;
        this.pencariKost = pencariKost;
    }
    

    public int getNotification_id() {return notification_id;}

    public void setNotification_id(int notification_id) {this.notification_id = notification_id;}

    public String getMessage() {return message;}

    public void setMessage(String message) {this.message = message;}

    public Date getNotifyTime() {return notifyTime;}

    public void setNotifyTime(Date notifyTime) {this.notifyTime = notifyTime;}

    public PencariKost getPencariKost() {return pencariKost;}

    public void setPencariKost(PencariKost pencariKost) {this.pencariKost = pencariKost;}
    
}
