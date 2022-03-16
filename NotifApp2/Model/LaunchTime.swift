//
//  LaunchTime.swift
//  NotifApp2
//
//  Created by Maral on 16.03.22.
//

import Foundation
import RealmSwift

struct LaunchTime {
    
    
    let timeGenerator      = TimeGenerator()
    let presetData         = PresetData()
    let notificationCenter = UNUserNotificationCenter.current()

    var category: Results<Category>?
    
    func launchTime() {
        
        let realm = try! Realm()
        if K.launchedBefore {
            
            print("this is not the first Launch")
            let cats = realm.objects(Category.self)
            
            for cat in cats {

                timeGenerator.setAllNotifications(repeats: false, freq: cat.freqs, intervals: cat.intervals, hours: cat.hours, category: cat.category, item: cat.items[Int.random(in: 0...(cat.items.count-1))].title)


                
            }

        } else {
            
            presetData.initiateData()
            print("First Launch")
            notificationCenter.requestAuthorization(options: [.alert, .sound]) {
                (permissionGranted, error) in
                if(!permissionGranted)
                {
                    print("Permission Denied")
                }
                UserDefaults.standard.set(true, forKey: "launchedBefore")
            }
            
        }
    }
}
