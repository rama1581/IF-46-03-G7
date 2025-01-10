package com.Group11.TugasBesar.services.notification;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Notification;
import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.payloads.requests.NotificationRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.NotificationRepository;
import com.Group11.TugasBesar.repositories.PencariKostRepository;

@Service
public class NotificationServiceImpl implements NotificationService{

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private PencariKostRepository pencariKostRepository;

    @Override
    public Response addNotification(NotificationRequest notificationRequest) {
        
        Notification notification = new Notification();
        notification.setMessage(notificationRequest.getMessage());
        notification.setNotifyTime(notificationRequest.getNotifyTime());
        notification.setPencariKost(notificationRequest.getPencariKost());
        notificationRepository.save(notification);

        Response response = new Response();
		response.setStatus(HttpStatus.CREATED.value());
		response.setMessage("Notification created successfully!");
		response.setData(notification);

        return response;
    }

    @Override
    public Response getNotifications() {
        List<Notification> notifications = notificationRepository.findAll();

        Response response = new Response();
        response.setStatus(HttpStatus.FOUND.value());
        response.setMessage("Notifications was found");
        response.setData(notifications);
        
        return response;
    }

    @Override
    public Response getNotificationByPencariKost(PencariKost pencariKost) {
    if (pencariKost == null) {
        return new Response(400, "PencariKost tidak valid.", null);
    }

    List<Notification> notifications = notificationRepository.findByPencariKost(pencariKost);

    return new Response(200, "Notifications fetched successfully", notifications);
}

    
    @Override
    public Response getNotificationsByConfirmedBookings(int pencariKostId) {
    try {
        // Ambil daftar notifikasi terkait PencariKost
        PencariKost pencariKost = pencariKostRepository.findById(pencariKostId)
                .orElseThrow(() -> new NoSuchElementException("PencariKost not found with ID: " + pencariKostId));
        List<Notification> notifications = notificationRepository.findByPencariKost(pencariKost);

        // Bungkus dalam Response
        return new Response(200, "Notifications fetched successfully", notifications);
    } catch (NoSuchElementException e) {
        return new Response(404, "PencariKost not found: " + e.getMessage(), null);
    } catch (Exception e) {
        return new Response(500, "Error: " + e.getMessage(), null);
    }
}

}
