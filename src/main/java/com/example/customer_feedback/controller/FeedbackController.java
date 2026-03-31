package com.example.customer_feedback.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.customer_feedback.model.Feedback;
import com.example.customer_feedback.model.User;
import com.example.customer_feedback.service.FeedbackService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    // Add Feedback
    @PostMapping("/add")
    public String addFeedback(Feedback feedback, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/"; // session expired
        }

        feedback.setUser(user); // ✅ IMPORTANT
        feedbackService.addFeedback(feedback);

        return "redirect:/dashboard";
    }
    // View User Feedback
    @GetMapping("/view/{userId}")
    public String viewUserFeedback(@PathVariable Long userId, Model model) {
        model.addAttribute("list", feedbackService.getUserFeedback(userId));
        return "feedback";
    }

    // View All Feedback (Admin)
    @GetMapping("/all")
    public String viewAllFeedback(Model model) {
        model.addAttribute("list", feedbackService.getAllFeedback());
        return "feedback";
    }

    // Delete Feedback
    @GetMapping("/delete/{id}")
    public String deleteFeedback(@PathVariable Long id) {
        feedbackService.deleteFeedback(id);
        return "redirect:/feedback/all";
    }
    
    @GetMapping("/edit/{id}")
    public String editFeedback(@PathVariable Long id, Model model) {
        Feedback feedback = feedbackService.getFeedbackById(id);
        model.addAttribute("feedback", feedback);
        return "edit";
    }
    
    @PostMapping("/update")
    public String updateFeedback(Feedback feedback) {
        feedbackService.updateFeedback(feedback);
        return "redirect:/feedback/all";
    }
    
}