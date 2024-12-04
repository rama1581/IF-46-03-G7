package com.Group11.TugasBesar;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.User;
import com.Group11.TugasBesar.payloads.requests.KostRequest;
import com.Group11.TugasBesar.payloads.requests.LoginRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.services.kost.KostService;
import com.Group11.TugasBesar.services.user.UserService;

@SpringBootTest
@AutoConfigureMockMvc
public class EditControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserService userService;

    @Autowired
    private KostService kostService;

    @Test
    public void PemilikKostShouldBeAbleToCreateNewKost() throws Exception {

        LoginRequest loginRequest = new LoginRequest("diamondismyname2002@gmail.com", "1234");

        Response userResponse = userService.login(loginRequest);
        User loggedUser = (User) userResponse.getData();
        PemilikKost loggedPemikKost = loggedUser.getPemilikKost();

        MockHttpSession session = new MockHttpSession();
        session.setAttribute("LOGGED_USER", loggedPemikKost);

        KostRequest kostRequest = new KostRequest();
        kostRequest.setName("TestKost");    
        kostRequest.setAddress("Bandung");
        kostRequest.setAllowedMale(true);
        kostRequest.setAllowedFemale(true);

        mockMvc.perform(MockMvcRequestBuilders.post("/edit/kost/create")
            .contentType(MediaType.APPLICATION_FORM_URLENCODED)
            .param("name", kostRequest.getName())
            .param("address", kostRequest.getAddress())
            .param("allowedMale", String.valueOf(kostRequest.isAllowedMale()))
            .param("allowedFemale", String.valueOf(kostRequest.isAllowedFemale()))
            .session(session)
        )
        .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
        .andExpect(MockMvcResultMatchers.redirectedUrl("/"));

        Response kostResponse = kostService.getKostByName(kostRequest.getName());
        assertNotNull(kostResponse);
    }
    
}
