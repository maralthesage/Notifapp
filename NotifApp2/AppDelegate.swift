//
//  AppDelegate.swift
//  NotifApp2
//
//  Created by Maral on 09.02.22.
//

import UIKit
import RealmSwift
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let setFirstorSecondLaunch = LaunchTime()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do{
            _ = try Realm()
                

            
        } catch {
            print("This is a realm initialization error \(error)")
        }
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.maral.NotifApp2", using: nil) { task in
            self.handleAppRefresh(task: task as! BGProcessingTask)
        }
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App Entered Background")
        scheduleAppRefresh()
    }
    
    func scheduleAppRefresh() {
            print("Task Scheduled")
            let request = BGProcessingTaskRequest(identifier: "com.devname.AppName.refresh")
            request.earliestBeginDate = Date(timeIntervalSinceNow: 60 * 60 ) // Fetch no earlier than 1 minutes from now
            
            do {
                try BGTaskScheduler.shared.submit(request)
                print("BGTask Scheduled")
            } catch {
                print("Could not schedule app refresh: \(error)")
            }
        }
    
    func handleAppRefresh(task: BGProcessingTask) {
        scheduleAppRefresh()
        print("BG Background Task fired")

        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        print("Op Queue Set")

        let context = BlockOperation {
            print("Background Task Running")
//This is my function to perform in background task
            self.setFirstorSecondLaunch.launchTime()
        }
        queue.addOperation(context)
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    



}

