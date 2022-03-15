//
//  TimeGenerator.swift
//  NotifApp2
//
//  Created by Maral on 28.02.22.
//

import UIKit
import RealmSwift
import UserNotifications

class TimeGenerator {
    
//    var notifications = [LocalNotification]()
    
    
//    func addNotification(category: String, item: String) -> Void {
//        let title = category
//        let body = item
        
//        notifications.append(LocalNotification(id: UUID().uuidString, title: title, body: body))
//        print(notifications)
                             
    
    
    func setNotification(repeats: Bool, freq: Int, intervals: Int, hours: Int, category: String, item: String) {
//        requestPermission()
//        addNotification(category: category, item: item)
        let dateComponents = calculatedTime(freq: freq, intervals: intervals, hours: hours)
        for date in dateComponents {
            scheduleNotifications(dateComponents: date[0], category: category, item: item)
            print(date[0])
        }
        


    }
    
//    func requestPermission() -> Void {
//        UNUserNotificationCenter
//            .current()
//            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
//                if granted == true && error == nil {
//                    // We have permission!
//                }
//        }
//    }
    
    func scheduleNotifications(dateComponents: DateComponents, category: String, item: String) {
        UIApplication.shared.applicationIconBadgeNumber = 0
//        print(notifications.count)

        let content = UNMutableNotificationContent()
        content.title = category
        content.body = item
        content.sound = .default

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let request = UNNotificationRequest(identifier: "id_\(item)", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
//                print("Scheduling notification with id: \(notification.id)")
            }
            
        }
            
        
    
    

    func calculatedTime(freq: Int, intervals: Int, hours: Int) -> [[DateComponents]] {
        var dateComponents = DateComponents()
//        let randomNumber = Int.random(in: 0...freq)
        var randate: [[DateComponents]] = []
        for _ in 0...freq {
            
            switch hours {
                
            case 0:
                if intervals == 0 {
//                    dateComponents.day = Int.random(in: 1...28)
                    dateComponents.hour = Int.random(in: 20..<21)
                    dateComponents.minute = Int.random(in: 55..<56)
                    dateComponents.second = Int.random(in: 0..<60)
                    randate.append([dateComponents])
//                    var randate: [Date?]
//                    randate.append(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                    
                } else if intervals == 1 {
                    dateComponents.weekday = Int.random(in: 1...7)
                    dateComponents.hour = Int.random(in: 9...16)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                } else {
                    dateComponents.day = Int.random(in: 1...28)
                    dateComponents.hour = Int.random(in: 9...16)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                    
                }
                
            case 1:
                if intervals == 0 {
                    dateComponents.hour = Int.random(in: 8...11)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                } else if intervals == 1 {
                    dateComponents.weekday = Int.random(in: 1...7)
                    dateComponents.hour = Int.random(in: 8...11)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                } else {
                    dateComponents.day = Int.random(in: 1...28)
                    dateComponents.hour = Int.random(in: 8...11)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                    
                }
                
            default:
                if intervals == 0 {
                    dateComponents.hour = Int.random(in: 20...21)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                } else if intervals == 1 {
                    dateComponents.weekday = Int.random(in: 1...7)
                    dateComponents.hour = Int.random(in: 20...21)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                } else {
                    dateComponents.day = Int.random(in: 1...29)
                    dateComponents.hour = Int.random(in: 20...21)
                    dateComponents.minute = Int.random(in: 0...59)
                    randate.append([dateComponents])
//                    print(Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!)
                    
                }
                
            }
                
        }

//        print(randate)
        
        return randate
    }
    

    
    
    
        
}
