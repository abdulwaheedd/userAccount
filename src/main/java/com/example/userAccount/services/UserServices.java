package com.example.userAccount.services;

import com.example.userAccount.Models.User;
import com.example.userAccount.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.Optional;

@Service
public class UserServices {
    @Autowired
    private UserRepository userRepository;
    public List<User> getUsers(){
        return userRepository.findAll();
    }

    public User getUserById(int id){
        return userRepository.findById(id)
                .orElseThrow(()-> new IllegalStateException("User with id number "+ id +" does not exist"));
    }
    public User SaveUser(User user){
        Optional<User> userbyemail = userRepository.findUserByEmail(user.getEmail());
        if(userbyemail.isPresent()){
            throw new IllegalStateException("Email Already Exists");
        }
        if(!checkValidDob(user.getDob())){
            throw  new IllegalStateException("dob should be in the past");
        }
        return userRepository.save(user);
    }
    public User updateUser(User user,int id){
        User existUser = userRepository.findById(id)
                .orElseThrow(()-> new IllegalStateException("User with id number "+id+" does not exist"));
        if(!checkValidDob(user.getDob())){
            throw  new IllegalStateException("dob should be in the past");
        }
        existUser.setFirstname(user.getFirstname());
        existUser.setLastname(user.getLastname());
        existUser.setDob(user.getDob());
        existUser.setEmail(user.getEmail());
        userRepository.save(existUser);
        return existUser;
    }
    public void deleteUser(int id){
        userRepository.findById(id).orElseThrow(()->new IllegalStateException("User with id number "+id+" does not exist"));
        userRepository.deleteById(id);
    }

    public boolean checkValidDob(LocalDate dob){
        LocalDate curDate = LocalDate.now();
        if(dob !=null){
            if(Period.between(dob,curDate).getYears() <= 0){
                return false;
            }
        }else{
            return false;
        }
        return true;
    }
}
