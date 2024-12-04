package com.Group11.TugasBesar.payloads.requests;

public class UserRequest {
    private String username;
    private Long phoneNumber;
    private String email;
    private String password;
    
    public UserRequest() {}

    public UserRequest(String username, Long phoneNumber, String email, String password) {
        this.username = username;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
    }

    public String getUsername() {return this.username;}

    public Long getPhoneNumber() {return this.phoneNumber;}

    public String getEmail() {return this.email;}
    
    public String getPassword() {return this.password;}

    public void setUsername(String username) {this.username = username;}

    public void setPhoneNumber(Long phoneNumber) {this.phoneNumber = phoneNumber;}

    public void setEmail(String email) {this.email = email;}
    
    public void setPassword(String password) {this.password = password;}
}
