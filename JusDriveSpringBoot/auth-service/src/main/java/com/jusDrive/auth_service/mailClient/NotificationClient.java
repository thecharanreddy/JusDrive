package com.jusDrive.auth_service.mailClient;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "notification-service")
public interface NotificationClient {
    @PostMapping("/alert/send")
    void sendNotification(@RequestBody NotificationRequest request);
}
