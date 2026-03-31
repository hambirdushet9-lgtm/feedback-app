package com.example.customer_feedback.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.customer_feedback.model.User;
import com.example.customer_feedback.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/"; // session expired
        }

        model.addAttribute("user", user); // ✅ PUT BACK INTO MODEL

        return "dashboard";
    }
    // Open Login Page
    @GetMapping("/")
    public String loginPage() {
        return "login";
    }

    // Open Register Page
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    // Handle Registration
    @PostMapping("/register")
    public String register(User user, Model model) {
        userService.register(user);
        model.addAttribute("msg", "Registration Successful!");
        return "login";
    }

    // Handle Login
    @PostMapping("/login")
    public String login(User user, HttpSession session, Model model) {

        User u = userService.login(user.getEmail(), user.getPassword());

        if (u != null) {
            session.setAttribute("user", u); // ✅ store in session

            // 🔥 ADD THIS BLOCK
            if ("ADMIN".equals(u.getRole())) {
                return "redirect:/admin/dashboard"; // 👨‍💼 admin page
            } else {
                return "redirect:/dashboard"; // 👤 user page
            }

        } else {
            model.addAttribute("error", "Invalid Email");
            return "login";
        }
    
    }
}