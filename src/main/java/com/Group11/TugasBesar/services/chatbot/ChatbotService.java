package com.Group11.TugasBesar.services.chatbot;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ChatbotService {

    @Value("${chatbot.api.key}")
    private String apiKey;

    @Value("${chatbot.api.url}")
    private String apiUrl;

    private final RestTemplate restTemplate;

    // Constructor injection untuk RestTemplate
    public ChatbotService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    // Method untuk menghasilkan response dari chatbot
    public String generateResponse(String userMessage) {
        try {
            String urlWithKey = apiUrl + "?key=" + apiKey;
    
            // JSON payload sesuai spesifikasi Gemini API
            String jsonPayload = "{ \"contents\": [{ \"parts\": [{ \"text\": \"" + userMessage + "\" }] }] }";
    
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
    
            HttpEntity<String> entity = new HttpEntity<>(jsonPayload, headers);
    
            // Kirim request POST ke API Google Gemini
            ResponseEntity<String> response = restTemplate.postForEntity(urlWithKey, entity, String.class);
    
            // Debugging: Print respons dari server
            System.out.println("Response: " + response.getBody());
    
            return response.getBody(); // Sesuaikan dengan parsing respons jika perlu
        } catch (Exception e) {
            e.printStackTrace();
            return "Maaf, terjadi kesalahan saat menghubungi server.";
        }
    }
    
}
    