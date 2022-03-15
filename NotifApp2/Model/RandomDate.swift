////
////  RandomDate.swift
////  NotifApp2
////
////  Created by Maral on 19.02.22.
////
//
//import Foundation
//
//class RandomDate {
//
//    let dateFormatter = DateFormatter()
//    
//    
//    
//    
//    func randDate(in interval: Double) -> [Date] {
//        
//        dateFormatter.timeZone = NSTimeZone.default
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        
//        if let firstOpen = UserDefaults.standard.object(forKey: "FirstOpen") as? Date {
////            print("The app was first opened on \(firstOpen)")
//        } else {
//            // This is the first launch
//            UserDefaults.standard.set(Date(), forKey: "FirstOpen")
//        }
//        
//        var date1 = UserDefaults.standard.object(forKey: "FirstOpen") as! Date
//        
//        
//        
//        
//        // INTERVAL FORMULA
////        if let interval = UserDefaults.standard.object(forKey: "Interval") as? TimeInterval {
////            UserDefaults.standard.set(20, forKey: "Interval")
////            print("The app has already have an interval as \(interval)")
////        } else {
////            // userpicker decides the variable that sits as 7 here
////            UserDefaults.standard.set(36 , forKey: "Interval")
////        }
//        var date2 = date1.addingTimeInterval(interval)
//        
//        if Date() > date2 {
//            UserDefaults.standard.set(Date(), forKey: "FirstOpen")
//            date1 = UserDefaults.standard.object(forKey: "FirstOpen") as! Date
////            date2 = date1.addingTimeInterval(UserDefaults.standard.object(forKey: "Interval") as! TimeInterval)
//            date2 = date1.addingTimeInterval(20)
//        } else {
////            print("we are still in the interval")
//        }
//        
//        return ([date1, date2])
//    }
//    
//    
//    
//    func randomBetween(in interval: Double) -> Date {
//        let dates = randDate(in: interval)
//        var date1 = dates[0]
//        var date2 = dates[1]
//        if date1 < date2 {
//            let temp = date2
//            date2 = date1
//            date1 = temp
//        }
//        let span = TimeInterval.random(in: date2.timeIntervalSinceNow...date1.timeIntervalSinceNow)
//        return Date(timeIntervalSinceNow: span)
//    }
//    
////    @objc func selectorTimer() {
////        print(mindfulness[0])
////        let dates = randDate(in: intervalPlaceHolder) // THIS IS A PLACEHOLDER
////        let dateFormatter = DateFormatter()
////        _ = randomBetween(in: intervalPlaceHolder)// THIS IS A PLACEHOLDER
////        dateFormatter.dateFormat = "YY/MM/dd HH:mm:ss"
////        print(mindfulness[Int.random(in: 0...(mindfulness.count - 1))])
////
////    }
//}
