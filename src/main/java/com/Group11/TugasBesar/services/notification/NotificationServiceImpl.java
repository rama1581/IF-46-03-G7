package com.Group11.TugasBesar.services.notification;

import java.util.List;

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
        
        List<Notification> notifications = notificationRepository.findByPencariKost(pencariKost);

        pencariKost.setNotifications(notifications);
        pencariKostRepository.save(pencariKost);

        Response response = new Response();
        response.setStatus(HttpStatus.FOUND.value());
        response.setMessage("Notifications was found");
        response.setData(notifications);
        
        return response;
    }
    
}
