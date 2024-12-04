package com.Group11.TugasBesar;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.LoginRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.user.UserService;

@SpringBootTest
@AutoConfigureMockMvc
public class LoginControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserService userService;

    @Test
    public void LandingPageShouldRedirectGuestToIndexJSP() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/"))
               .andExpect(MockMvcResultMatchers.status().isOk())
               .andExpect(MockMvcResultMatchers.view().name("landingPage/index"));
    }

    @Test
    public void LoginShouldRedirectPencariKostToLandingPage() throws Exception {

        LoginRequest loginRequest = new LoginRequest("izzanalfian1@gmail.com", "1234");

        Response response = userService.login(loginRequest);
        User loggedUser = (User) response.getData();
        PencariKost loggedPencariKost = loggedUser.getPencariKost();

        mockMvc.perform(MockMvcRequestBuilders.post("/login")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .param("email", loginRequest.getEmail())
                .param("password", loginRequest.getPassword())
        )
        .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
        .andExpect(MockMvcResultMatchers.redirectedUrl("/"))
        .andExpect(MockMvcResultMatchers.request().sessionAttribute("LOGGED_USER", Matchers.hasProperty("pencariKost_id", Matchers.equalTo(loggedPencariKost.getPencariKost_id()))))
        .andExpect(MockMvcResultMatchers.request().sessionAttribute("USER_TYPE", Matchers.is("PencariKost")));

    }

    @Test
    public void LoginShouldRedirectPemilikKostToLandingPage() throws Exception {

        LoginRequest loginRequest = new LoginRequest("diamondismyname2002@gmail.com", "1234");

        Response response = userService.login(loginRequest);
        User loggedUser = (User) response.getData();
        PemilikKost loggedPemikKost = loggedUser.getPemilikKost();

        mockMvc.perform(MockMvcRequestBuilders.post("/login")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .param("email", loginRequest.getEmail())
                .param("password", loginRequest.getPassword())
        )
        .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
        .andExpect(MockMvcResultMatchers.redirectedUrl("/"))
        .andExpect(MockMvcResultMatchers.request().sessionAttribute("LOGGED_USER", Matchers.hasProperty("pemilikKost_id", Matchers.equalTo(loggedPemikKost.getPemilikKost_id()))))
        .andExpect(MockMvcResultMatchers.request().sessionAttribute("USER_TYPE", Matchers.is("PemilikKost")));

    }

    @Test
    public void LoginShouldRedirectAdminToLandingPage() throws Exception {

        LoginRequest loginRequest = new LoginRequest("admin@gmail.com", "1234");

        Response response = userService.login(loginRequest);
        User loggedUser = (User) response.getData();
        Admin loggedAdmin = loggedUser.getAdmin();

        mockMvc.perform(MockMvcRequestBuilders.post("/login")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .param("email", loginRequest.getEmail())
                .param("password", loginRequest.getPassword())
        )
        .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
        .andExpect(MockMvcResultMatchers.redirectedUrl("/"))
        .andExpect(MockMvcResultMatchers.request().sessionAttribute("LOGGED_USER", Matchers.hasProperty("admin_id", Matchers.equalTo(loggedAdmin.getAdmin_id()))))
        .andExpect(MockMvcResultMatchers.request().sessionAttribute("USER_TYPE", Matchers.is("Admin")));

    }
    
}
