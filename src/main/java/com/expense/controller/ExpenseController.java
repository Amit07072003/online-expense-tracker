package com.expense.controller;

import com.expense.model.Expense;
import com.expense.model.User;
import com.expense.service.ExpenseService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ExpenseController {

    @Autowired
    private ExpenseService expenseService;

    @GetMapping("/add-expense")
    public String showAddExpenseForm(Model model, HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) return "redirect:/login";
        model.addAttribute("expense", new Expense());
        return "add-expense";
    }
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
    @PostMapping("/save-expense")
    public String saveExpense(@ModelAttribute Expense expense, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";
        expense.setUser(user);
        expenseService.saveExpense(expense);
        return "redirect:/view-expenses";
    }

    @GetMapping("/view-expenses")
    public String viewExpenses(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        List<Expense> expenses = expenseService.getAllExpenses(user);
        model.addAttribute("expenses", expenses);
        return "view-expenses";
    }

    @GetMapping("/edit-expense")
    public String editExpense(@RequestParam Long id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        Expense expense = expenseService.getExpenseById(id);

        // Security: Ensure the expense belongs to the logged-in user
        if (expense.getUser().getId().equals(user.getId())) {
            model.addAttribute("expense", expense);
            return "add-expense";
        } else {
            return "redirect:/view-expenses"; // unauthorized edit attempt
        }
    }


    @GetMapping("/delete-expense")
    public String deleteExpense(@RequestParam Long id) {
        expenseService.deleteExpense(id);
        return "redirect:/view-expenses";
    }
}
