package com.expense.controller;

import com.expense.model.User;
import com.expense.service.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;
    @GetMapping("/")
    public String showLoginPage1() {
        return "login";
    }
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

     @GetMapping("/favicon.ico")
    public void favicon() {
        // This method can be empty to avoid 404 for favicon requests
        // Or you can serve a favicon file if you have one
        
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        User user = userService.login(email, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/dashboard";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("user", new User()); // Pass empty user object to form
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("user") User user) {
        userService.register(user);  // This saves the user with monthly income
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
