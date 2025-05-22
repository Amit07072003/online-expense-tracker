package com.expense.controller;
import com.expense.model.Expense;
import com.expense.model.User;
import com.expense.service.ExpenseService;
import jakarta.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @Autowired
    private ExpenseService expenseService;

     @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

     @GetMapping("/favicon.ico")
    public String favicon() {
        // This method can be empty to avoid 404 for favicon requests
        // Or you can serve a favicon file if you have one
         return "login";
    }

    @GetMapping("/dashboard")
    public String showDashboard(Model model, HttpSession session) {
        // Get the logged-in user
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        // Get monthly income and total expense for the user
        double monthlyIncome = expenseService.getMonthlyIncome(user); // Get monthly income from your service
        double totalExpense = expenseService.getTotalExpense(user); // Get total expense from your service
        double remainingBalance = monthlyIncome - totalExpense;

        // Pass the data to the dashboard view
        model.addAttribute("monthlyIncome", monthlyIncome);
        model.addAttribute("totalExpense", totalExpense);
        model.addAttribute("remainingBalance", remainingBalance);

        // Get expenses by category (optional for charts)
        model.addAttribute("categoryData", expenseService.getExpensesByCategory(user));

        return "dashboard";
    }

}

