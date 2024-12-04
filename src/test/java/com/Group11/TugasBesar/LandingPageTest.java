package com.Group11.TugasBesar;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.Group11.TugasBesar.models.Admin;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.models.PencariKost;

@SpringBootTest
@AutoConfigureMockMvc
public class LandingPageTest{

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void LandingPageShouldRedirectGuestToIndexJSP() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/"))
               .andExpect(MockMvcResultMatchers.status().isOk())
               .andExpect(MockMvcResultMatchers.view().name("landingPage/index"));
    }

    @Test
    public void LandingPageShouldRedirectPencariKostToIndexPencariKostJSP() throws Exception {

        MockHttpSession session = new MockHttpSession();
        session.setAttribute("LOGGED_USER", new PencariKost());

        mockMvc.perform(MockMvcRequestBuilders.get("/").session(session))
               .andExpect(MockMvcResultMatchers.status().isOk())
               .andExpect(MockMvcResultMatchers.view().name("landingPage/indexPencariKost"));
    }

    @Test
    public void LandingPageShouldRedirectPemilikKostToIndexPemilikKostJSP() throws Exception {

        MockHttpSession session = new MockHttpSession();
        session.setAttribute("LOGGED_USER", new PemilikKost());

        mockMvc.perform(MockMvcRequestBuilders.get("/").session(session))
                .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
                .andExpect(MockMvcResultMatchers.redirectedUrl("/edit/kost"));
    }

    @Test
    public void LandingPageShouldRedirectAdminToIndexAdminJSP() throws Exception {

        MockHttpSession session = new MockHttpSession();
        session.setAttribute("LOGGED_USER", new Admin());

        mockMvc.perform(MockMvcRequestBuilders.get("/").session(session))
                .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
                .andExpect(MockMvcResultMatchers.redirectedUrl("/dashboard"));
    }
}