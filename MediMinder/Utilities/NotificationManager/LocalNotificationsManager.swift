//
//  LocalNotificationsManager.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 23/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationsManager {
    
    var notifications = [Notification]()
    
    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            
            if granted == true && error == nil {
                self.scheduleNotifications()
            }
        }
    }
    
    func schedule() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break // Do nothing
            }
        }
    }
    
    private func scheduleNotifications() {
        for notification in notifications {
            let content      = UNMutableNotificationContent()
            content.title    = notification.title
            content.sound    = .default
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.dateTime, repeats: true)
            
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
            }
        }
    }
    
    static func removeFutureNotification(for dayTime: Greetings) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (pendingRequests) in
            
            pendingRequests.forEach { (notification) in
                
                if notification.identifier == dayTime.notificationId {
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [dayTime.notificationId])
                    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
                    var components = Calendar.current.dateComponents([.hour, .minute, .second], from: tomorrow!)
                    components.hour = dayTime.medicineTime.hour
                    components.minute = dayTime.medicineTime.minute
                    components.second = dayTime.medicineTime.second
                    
                    let notificationManager = LocalNotificationsManager()
                    notificationManager.notifications = [ Notification(id: dayTime.notificationId, title: dayTime.notificationText, dateTime: components) ]
                    notificationManager.schedule()
                }
            }
        }
    }
    
    func checkDeliveredNotifications(for dayTime: Greetings) {
        UNUserNotificationCenter.current().getDeliveredNotifications { (deliveredNotifications) in
            deliveredNotifications.forEach { (notification) in
            }
        }
    }
    
    static func generateNotifications() {
        let notificationManager = LocalNotificationsManager()
        notificationManager.notifications = [
            Notification(id: Greetings.morning.notificationId, title: Greetings.morning.notificationText, dateTime: Greetings.morning.medicineTime),
            Notification(id: Greetings.afternoon.notificationId, title: Greetings.afternoon.notificationText, dateTime: Greetings.afternoon.medicineTime),
            Notification(id: Greetings.evening.notificationId, title: Greetings.evening.notificationText, dateTime: Greetings.evening.medicineTime)
        ]
        
        notificationManager.schedule()
    }
    
}
