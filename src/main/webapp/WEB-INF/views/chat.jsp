<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot</title>
    <link rel="stylesheet" href="css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body>

        <!-- Chatbot UI -->
        <div id="chatbot-container" 
        style="position: fixed; bottom: 20px; right: 20px; width: 300px; height: 400px; background-color: #fff; border: 1px solid #ccc; border-radius: 8px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2); display: none; z-index: 9999;">
    <div id="chatbot-header" style="background-color: #007bff; color: white; padding: 10px; border-top-left-radius: 8px; border-top-right-radius: 8px; position: relative;">
        <h5 style="margin:0;">KOST-IN Chatbot</h5>
        <!-- Tombol Close -->
        <button onclick="closeChatbot()" 
                style="position: absolute; top: 5px; right: 5px; background: transparent; border: none; font-size: 18px; color: #fff; cursor: pointer;">
            &times;
        </button>
    </div>
    <div id="chatbot-messages" style="padding: 10px; height: 300px; overflow-y: scroll;">
        <!-- Pesan-pesan chat akan muncul di sini -->
    </div>
    <div id="chatbot-footer" style="padding: 10px; display: flex; align-items: center;">
        <input type="text" id="user-input" class="form-control" placeholder="Ketik pesan..." onkeypress="handleKeyPress(event)" style="flex: 1; margin-right: 10px;" />
        <button class="chatbot-submit" onclick="sendMessage()" style="margin-left: auto;">Kirim</button>
    </div>
    </div>

    <!-- Tombol untuk membuka chatbot -->
    <button onclick="toggleChatbot()" class="btn btn-primary" style="position: fixed; bottom: 20px; right: 20px; border-radius: 50%; width: 60px; height: 60px; display: block;">
    <i class="fas fa-comments"></i>
    </button>

    <script>
        // Fungsi untuk menampilkan/menyembunyikan chatbot
        function toggleChatbot() {
            var chatbotContainer = document.getElementById("chatbot-container");
            chatbotContainer.style.display = chatbotContainer.style.display === "none" ? "block" : "none";
        }


        function closeChatbot() {
        var chatbotContainer = document.getElementById("chatbot-container");
        chatbotContainer.style.display = "none";
        }

        // Fungsi untuk menangani input pengguna
    function sendMessage() {
    var userInput = document.getElementById("user-input").value.trim();
    if (userInput === "") return; // Validasi input kosong

    appendMessage("Anda: " + userInput, "user-message");

    // Kirim pesan ke server Spring Boot
    fetch('/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: new URLSearchParams({ userMessage: userInput })
    })
    .then(response => response.json())  // Ambil respons sebagai JSON
    .then(data => {
        console.log("Respons dari backend:", data); // Debug respons
        
        // Ekstrak teks dari respons JSON
        const botResponseText = data.candidates[0].content.parts[0].text;
        
        // Tampilkan respons chatbot
        var botDiv = document.createElement("div");
        botDiv.className = "bot-response";
        botDiv.textContent = "Gemini : " + botResponseText;
        document.getElementById("chatbot-messages").appendChild(botDiv);
    })
    .catch(error => console.error("Error:", error));

    // Bersihkan input setelah mengirim pesan
    document.getElementById("user-input").value = "";
}

        // Fungsi untuk menambahkan pesan ke area chat
        function appendMessage(message, className) {
            var messageDiv = document.createElement("div");
            messageDiv.className = className;
            messageDiv.textContent = message;

            var messagesContainer = document.getElementById("chatbot-messages");
            messagesContainer.appendChild(messageDiv);

            // Scroll otomatis ke bawah
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }

        // Fungsi untuk menangani Enter key
        function handleKeyPress(event) {
            if (event.key === "Enter") {
                sendMessage();
            }
        }
    </script>

    <style>
        /* Styling untuk pesan pengguna dan bot */
        .user-message {
            text-align: right;
            margin: 10px 0;
            color: #007bff;
            font-weight: bold;
        }

        .bot-response {
            text-align: left;
            margin: 5px 0;
            color: #333;
        }

        .error-message {
            text-align: center;
            color: red;
            font-style: italic;
        }
    </style>

</body>
</html>
