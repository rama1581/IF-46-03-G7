package com.Group11.TugasBesar.models;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class PencariKost {
    @Id
    @GeneratedValue
    @Column(name = "pencariKost_id")
    private int pencariKost_id;

    @OneToOne(mappedBy = "pencariKost")
    private User user;

    @OneToMany(mappedBy = "pencariKost")
    private List<Notification> notifications;

    public PencariKost() {}

    public PencariKost(int pencariKost_id, User user, List<Notification> notifications) {
        this.pencariKost_id = pencariKost_id;
        this.user = user;
        this.notifications = notifications;
    }

    public void setPencariKost_id(int pencariKost_id) {this.pencariKost_id = pencariKost_id;}

    public void setUser(User user) {this.user = user;}

    public int getPencariKost_id() {return this.pencariKost_id;}

    public User getUser() {return this.user;}

    public List<Notification> getNotifications() {return notifications;}

    public void setNotifications(List<Notification> notification) {this.notifications = notification;}

    
}
