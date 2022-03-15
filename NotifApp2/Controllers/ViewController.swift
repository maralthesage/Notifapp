//
//  ViewController.swift
//  NotifApp2
//
//  Created by Maral on 09.02.22.
//

import UIKit
import RealmSwift
import UserNotifications


class ViewController: UIViewController {
    
    let timeGenerator = TimeGenerator()
    
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    let k = K()
    let realm = try! Realm()
    let presetData = PresetData()
    let notificationCenter = UNUserNotificationCenter.current()
    var items: Results<Item>?
    var category: Results<Category>?
    
    @IBOutlet weak var uLabel: UILabel!
    
//    var requests: [UNNotificationRequest] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        launchTime()
        
    }
    
    
    // TEST for github
    
    func launchTime() {
        let realm = try! Realm()
        if launchedBefore {
            
            print("this is not the first Launch")
            let cats = realm.objects(Category.self)
            
            for cat in cats {
//                print(cat.category)
                
                timeGenerator.setNotification(repeats: false, freq: cat.freqs, intervals: cat.intervals, hours: cat.hours, category: cat.category, item: cat.items[Int.random(in: 0...(cat.items.count-1))].title)
                
                
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



