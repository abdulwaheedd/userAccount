package com.example.userAccount.Models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
@Entity
@Data
@Table(name = "tblUsers")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Id;
    @Column(name = "first_name",nullable = false)
    //@JsonProperty("firstname")
    private String firstname;
    @Column(name = "last_name",nullable = false)
    //@JsonProperty("lastname")
    private String lastname;
    //@JsonProperty("dob")
    private LocalDate dob;
    @Column(name = "email",nullable = false,unique = true)
    //@JsonProperty("email")
    private String email;
}
