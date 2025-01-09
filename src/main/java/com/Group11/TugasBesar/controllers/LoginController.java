package com.Group11.TugasBesar.controllers;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.LoginRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.user.UserService;

import jakarta.servlet.http.HttpSession;


@SpringBootApplication
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage(HttpSession httpSession) {
        return "loginPage/login";
    }


    // @RequestMapping(value = "login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    // public String loginRequest(@RequestBody LoginRequest loginRequest, HttpSession httpSession, Model model) {
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginRequest(LoginRequest loginRequest, HttpSession httpSession, Model model) {

        Response response;
        try {
            response = userService.login(loginRequest);
            User user = (User) response.getData();

            // If the user with the same username and password was found
            if (response.getStatus() == HttpStatus.FOUND.value()) {

                // Check if user is a PencariKost, PemilikKost, or Admin
                if (user.getPencariKost() != null) {
                    PencariKost pencariKost = user.getPencariKost();

                    response.setData(pencariKost);
                    httpSession.setAttribute("LOGGED_USER", pencariKost);
                    httpSession.setAttribute("USER_TYPE", "PencariKost");
                    System.out.println("User is a PencariKost");
                    return "redirect:/";
                }
                else if (user.getPemilikKost() != null) {
                    PemilikKost pemilikKost = user.getPemilikKost();
                    
                    response.setData(pemilikKost);
                    httpSession.setAttribute("LOGGED_USER", pemilikKost);
                    httpSession.setAttribute("USER_TYPE", "PemilikKost");
                    System.out.println("User is a PemilikKost");
                    return "redirect:/";
                }
                else if (user.getAdmin() != null) {
                    Admin admin = user.getAdmin();
                    
                    response.setData(admin);
                    httpSession.setAttribute("LOGGED_USER", admin);
                    httpSession.setAttribute("USER_TYPE", "Admin");
                    System.out.println("User is a Admin");
                    return "redirect:/";
                }
                else {
                    response.setMessage("User is not PencariKost, PemilikKost, or Admin");
                    model.addAttribute("message", response.getMessage());
                    return "unexpectedError";
                }
            }
            else if (response.getStatus() == HttpStatus.UNAUTHORIZED.value()) {
                    model.addAttribute("errorMessage", "Email/Password Tidak Sesuai!");
                    return "loginPage/login";
                }
            else {
                model.addAttribute("message", "Error over LoginController");
                return "unexpectedError";
            }
        } catch (NoSuchElementException e) {
            model.addAttribute("isUserNonexistent", true);
            return "loginPage/login";
        }
    }

    @GetMapping("/login/admin")
    public String loginAsAdmin() {
        return "loginPage/loginAdmin";
    }
    
    @GetMapping("/editprofileaspencari")
    public String showEditProfilePage(HttpSession session, Model model) {
        Object loggedInUser = session.getAttribute("LOGGED_USER");
    
        if (loggedInUser == null) {
            return "redirect:/login"; // Redirect ke login jika tidak ada user di sesi
        }
    
        if (loggedInUser instanceof PencariKost) {
            PencariKost pencariKost = (PencariKost) loggedInUser;
            model.addAttribute("user", pencariKost.getUser()); // Kirim User terkait ke JSP
        } else if (loggedInUser instanceof PemilikKost) {
            PemilikKost pemilikKost = (PemilikKost) loggedInUser;
            model.addAttribute("user", pemilikKost.getUser()); // Kirim User terkait ke JSP
        } else {
            model.addAttribute("message", "Invalid user type.");
            return "unexpectedError";
        }
    
        return "editprofileaspencari";
    }

    @PostMapping("/editprofileaspencari")
    public String updateProfile(User user, HttpSession session, Model model) {
        try {
            Object loggedInUser = session.getAttribute("LOGGED_USER");
    
            if (loggedInUser instanceof PencariKost) {
                PencariKost pencariKost = (PencariKost) loggedInUser;
                User existingUser = pencariKost.getUser();
    
                existingUser.setUsername(user.getUsername());
                if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                    existingUser.setPassword(user.getPassword());
                }
    
                Response response = userService.updateUser(existingUser);
    
                if (response.getStatus() == HttpStatus.OK.value()) {
                    session.setAttribute("LOGGED_USER", pencariKost);
                    model.addAttribute("successMessage", "Profile updated successfully.");
                } else {
                    model.addAttribute("errorMessage", response.getMessage());
                }
    
            } else if (loggedInUser instanceof PemilikKost) {
                PemilikKost pemilikKost = (PemilikKost) loggedInUser;
                User existingUser = pemilikKost.getUser();
    
                existingUser.setUsername(user.getUsername());
                if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                    existingUser.setPassword(user.getPassword());
                }
    
                Response response = userService.updateUser(existingUser);
    
                if (response.getStatus() == HttpStatus.OK.value()) {
                    session.setAttribute("LOGGED_USER", pemilikKost);
                    model.addAttribute("successMessage", "Profile updated successfully.");
                } else {
                    model.addAttribute("errorMessage", response.getMessage());
                }
            }
    
            return "editprofileaspencari";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error updating profile: " + e.getMessage());
            return "editprofileaspencari";
        }
    }

    @GetMapping("/editprofileaspemilik")
    public String showEditProfilePemilikPage(HttpSession session, Model model) {
    Object loggedInUser = session.getAttribute("LOGGED_USER");

    // Redirect ke login jika user belum login
    if (loggedInUser == null) {
        return "redirect:/login";
    }

    // Hanya proses untuk PemilikKost
    if (loggedInUser instanceof PemilikKost) {
        PemilikKost pemilikKost = (PemilikKost) loggedInUser;
        model.addAttribute("user", pemilikKost.getUser()); // Tambahkan data User terkait ke model
    } else {
        model.addAttribute("message", "Invalid user type."); // Jika user bukan PemilikKost
        return "unexpectedError";
    }

    return "editprofileaspemilik"; // Arahkan ke JSP `editprofileaspemilik.jsp`
}

@PostMapping("/editprofileaspemilik")
public String updateProfilePemilik(User user, HttpSession session, Model model) {
    try {
        Object loggedInUser = session.getAttribute("LOGGED_USER");

        // Hanya proses untuk PemilikKost
        if (loggedInUser instanceof PemilikKost) {
            PemilikKost pemilikKost = (PemilikKost) loggedInUser;
            User existingUser = pemilikKost.getUser();

            // Update username dan password (jika disediakan)
            existingUser.setUsername(user.getUsername());
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                existingUser.setPassword(user.getPassword());
            }

            // Simpan perubahan ke database melalui service
            Response response = userService.updateUser(existingUser);

            // Tampilkan pesan berdasarkan status respons
            if (response.getStatus() == HttpStatus.OK.value()) {
                session.setAttribute("LOGGED_USER", pemilikKost);
                model.addAttribute("successMessage", "Profile updated successfully.");
            } else {
                model.addAttribute("errorMessage", response.getMessage());
            }
        } else {
            model.addAttribute("message", "Invalid user type.");
            return "unexpectedError";
        }

        return "editprofileaspemilik"; // Kembali ke halaman `editprofileaspemilik.jsp`
    } catch (Exception e) {
        e.printStackTrace();
        model.addAttribute("errorMessage", "Error updating profile: " + e.getMessage());
        return "editprofileaspemilik";
    }
}
 
}
