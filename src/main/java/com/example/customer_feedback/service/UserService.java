package com.example.customer_feedback.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.customer_feedback.model.User;
import com.example.customer_feedback.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    // Register User
    public User register(User user) {
        user.setRole("USER"); // default role
        return userRepo.save(user);
    }

    // Login User
    public User login(String email, String password) {
        User user = userRepo.findByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}