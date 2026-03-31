package com.example.customer_feedback.service;



import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.customer_feedback.model.Feedback;
import com.example.customer_feedback.repository.FeedbackRepository;

@Service
public class FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepo;

    // Add Feedback
    public Feedback addFeedback(Feedback feedback) {
        feedback.setCreatedAt(LocalDateTime.now());
        return feedbackRepo.save(feedback);
    }

    // Get feedback by user
    public List<Feedback> getUserFeedback(Long userId) {
        return feedbackRepo.findByUserUserId(userId);
    }

    // Get all feedback (Admin)
    public List<Feedback> getAllFeedback() {
        return feedbackRepo.findAll();
    }

    // Delete feedback
    public void deleteFeedback(Long id) {
        feedbackRepo.deleteById(id);
    }
    
    public Feedback getFeedbackById(Long id) {
        return feedbackRepo.findById(id).orElse(null);
    }
    public Feedback updateFeedback(Feedback feedback) {
        feedback.setCreatedAt(java.time.LocalDateTime.now());
        return feedbackRepo.save(feedback);
    }
    
    
}