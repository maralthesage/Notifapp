//
//  TimeGenerator.swift
//  NotifApp2
//
//  Created by Maral on 28.02.22.
//

import UIKit
import RealmSwift

class TimeGenerator {
    

    
    func scheduledTest(category: String, item: String,  freq: Int, intervals: Int, hours: Int) -> [UNNotificationRequest] {
        let content = UNMutableNotificationContent()
        var userRequest: [UNNotificationRequest] = []
        content.title = category
        content.sound = .default
        content.body = item
        
        let dateComps = calculatedTime(freq: freq, intervals: intervals, hours: hours)
        
        for date in dateComps {
            print(date[0])
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: date[0], repeats: false)
            let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
//            UNUserNotificationCenter.current().add(request) { error in
//                if error != nil  {
//                    print("an error occured \(String(describing: error))")
//                }
//                
//            }
            userRequest.append(request)
        }
        return userRequest
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
                    dateComponents.hour = Int.random(in: 14..<15)
                    dateComponents.minute = Int.random(in: 01...03)
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
