package com.expense.model;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
public class Expense {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String category;
    private double amount;
    
    @Column(columnDefinition = "DATE")  // Ensures that the column is stored as DATE
    private LocalDate date;

    @ManyToOne
    private User user;

    // Default constructor
    public Expense() {}

    // Getters and Setters
    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getCategory() { return category; }

    public void setCategory(String category) { this.category = category; }

    public double getAmount() { return amount; }

    public void setAmount(double amount) { this.amount = amount; }

    public LocalDate getDate() { return date; }

    public void setDate(LocalDate date) { this.date = date; }

    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }

    // Optional: toString method for easier debugging/logging
    @Override
    public String toString() {
        return "Expense{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", amount=" + amount +
                ", date=" + date +
                ", user=" + user.getUsername() +
                '}';
    }
}
