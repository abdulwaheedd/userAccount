package com.example.userAccount.controller;

import com.example.userAccount.Models.User;
import com.example.userAccount.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*")
public class UserController {
    @Autowired
    private UserServices userServices;
    @GetMapping()
    public List<User> getUsers(){
        return userServices.getUsers();
    }
    @GetMapping("{id}")
    public ResponseEntity<User> getUser(@PathVariable("id") Integer userid){
        return new ResponseEntity<>(userServices.getUserById(userid),HttpStatus.OK);
    }
    @PutMapping("{id}")
    public ResponseEntity<User> updateUser(@RequestBody User user,@PathVariable("id") Integer userid){
        return new ResponseEntity<>( userServices.updateUser(user,userid), HttpStatus.OK);
    }
    @DeleteMapping("{id}")
    public ResponseEntity<String> deleteUser(@PathVariable("id") Integer userid){
        userServices.deleteUser(userid);
        return new ResponseEntity<>("User with id number "+ userid + "  has been deleted",HttpStatus.OK);
    }
    @PostMapping()
    public ResponseEntity<User> saveUser(@RequestBody  User user){
        return new ResponseEntity<>( userServices.SaveUser(user), HttpStatus.CREATED);
    }
}
