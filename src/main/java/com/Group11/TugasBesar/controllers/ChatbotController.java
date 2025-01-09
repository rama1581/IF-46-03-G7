package com.Group11.TugasBesar.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Group11.TugasBesar.services.chatbot.ChatbotService;
@Controller
public class ChatbotController {

    @Autowired
    private ChatbotService chatbotService;

   @PostMapping("/chat")
    @ResponseBody  // Memberitahukan Spring untuk mengembalikan respons sebagai teks (plain text)
    public String handleChatRequest(@RequestParam("userMessage") String userMessage) {
    System.out.println("User Message: " + userMessage); // Debug input

    // Mengambil respons dari service
    String chatbotResponse = chatbotService.generateResponse(userMessage);
    
    System.out.println("Chatbot Response: " + chatbotResponse); // Debug respons

    // Mengembalikan respons chatbot dalam format plain text
    return chatbotResponse;
}

}