package com.example.customer_feedback.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "feedback")
public class Feedback {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long feedbackId;

    private String feedbackText;

    private int rating;

    private LocalDateTime createdAt;

    // Many feedbacks belong to one user
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Feedback(Long feedbackId, String feedbackText, int rating, LocalDateTime createdAt, User user) {
		super();
		this.feedbackId = feedbackId;
		this.feedbackText = feedbackText;
		this.rating = rating;
		this.createdAt = createdAt;
		this.user = user;
	}

	public Long getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Long feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getFeedbackText() {
		return feedbackText;
	}

	public void setFeedbackText(String feedbackText) {
		this.feedbackText = feedbackText;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
    
}
