package com.example.customer_feedback.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.customer_feedback.model.User;
import com.example.customer_feedback.service.FeedbackService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        // 🔒 Secure check
        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/dashboard";
        }

        model.addAttribute("list", feedbackService.getAllFeedback());

        return "admin_dashboard";
    }
    @GetMapping("/logout")
    public String backtologin() {
    	return "login";
    }
}