package com.Group11.TugasBesar.services.notification;

import com.Group11.TugasBesar.models.PencariKost;
import com.Group11.TugasBesar.payloads.requests.NotificationRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface NotificationService {
    
    Response addNotification(NotificationRequest notificationRequest);

    Response getNotifications();

    Response getNotificationByPencariKost(PencariKost pencariKost);

    Response getNotificationsByConfirmedBookings(int pencariKostId);

}
