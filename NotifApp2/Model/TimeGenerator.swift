//
//  TimeGenerator.swift
//  NotifApp2
//
//  Created by Maral on 28.02.22.
//

import UIKit
import RealmSwift
import UserNotifications

struct TimeGenerator {
    
    
    func setAllNotifications(repeats: Bool, freq: Int, hours: Int, category: String, categ: Category) {

        let dateComponents = calculateNotificationDateComponents(freq: freq, hours: hours)
        
        for date in dateComponents {
            print(date)
            
            let itemForDate = randomItem(category: categ)

            
            setEachNotification(dateComponents: date[0], category: category, item: itemForDate)
            print(category, " | ", date[0], " | ", itemForDate)

            
        }
    }
    
    private func randomItem(category: Category) -> String {
        
        let randNum = Int.random(in: 0...category.items.count - 1)
        return category.items[randNum].title
    }
    
    

    
    
    
    private func setEachNotification(dateComponents: DateComponents, category: String, item: String) {


        let content   = UNMutableNotificationContent()
        content.title = category
        content.body  = item
        content.sound = .default

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
                                                        repeats: false)
        
            let request = UNNotificationRequest(identifier: "id_\(item)",
                                                content: content,
                                                trigger: trigger)
        
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }

            }
            
        }
            

   

    private func calculateNotificationDateComponents(freq: Int, hours: Int) -> [[DateComponents]] {

        var dateComponents = DateComponents()
        var randomDate: [[DateComponents]] = []
        
        for _ in 0...freq {
            
            switch hours {
                
            case 0:
//                if intervals == 0 {

                    dateComponents.hour   = Int.random(in: 9..<17)
                    dateComponents.minute = Int.random(in: 0..<60)
                    dateComponents.second = Int.random(in: 0..<60)
                    randomDate.append([dateComponents])

//                } else if intervals == 1 {
//
//                    dateComponents.weekday = Int.random(in: 1...7)
//                    dateComponents.hour    = Int.random(in: 9...16)
//                    dateComponents.minute  = Int.random(in: 0...59)
//                    randomDate.append([dateComponents])
//
//                } else {
//
//                    dateComponents.day    = Int.random(in: 1...28)
//                    dateComponents.hour   = Int.random(in: 9...16)
//                    dateComponents.minute = Int.random(in: 0...59)
//                    randomDate.append([dateComponents])

//                }
                
            case 1:
//                if intervals == 0 {
                    
                    dateComponents.hour   = Int.random(in: 8...11)
                    dateComponents.minute = Int.random(in: 0...59)
                    randomDate.append([dateComponents])

//                } else if intervals == 1 {
//
//                    dateComponents.weekday = Int.random(in: 1...7)
//                    dateComponents.hour    = Int.random(in: 8...11)
//                    dateComponents.minute  = Int.random(in: 0...59)
//                    randomDate.append([dateComponents])
//
//                } else {
//
//                    dateComponents.day    = Int.random(in: 1...28)
//                    dateComponents.hour   = Int.random(in: 8...11)
//                    dateComponents.minute = Int.random(in: 0...59)
//                    randomDate.append([dateComponents])
//
//                }
                
            default:
//                if intervals == 0 {
                    
                    dateComponents.hour   = Int.random(in: 20...21)
                    dateComponents.minute = Int.random(in: 0...59)
                    randomDate.append([dateComponents])

//                } else if intervals == 1 {
//
//                    dateComponents.weekday = Int.random(in: 1...7)
//                    dateComponents.hour    = Int.random(in: 20...21)
//                    dateComponents.minute  = Int.random(in: 0...59)
//                    randomDate.append([dateComponents])
//
//                } else {
//
//                    dateComponents.day    = Int.random(in: 1...29)
//                    dateComponents.hour   = Int.random(in: 20...21)
//                    dateComponents.minute = Int.random(in: 0...59)
//                    randomDate.append([dateComponents])
//                }
                
            }
                
        }

        return randomDate
    }
    

    
    
    
        
}
