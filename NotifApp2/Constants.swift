//
//  Constants.swift
//  NotifApp2
//
//  Created by Maral on 09.02.22.
//

import Foundation

struct K {
    static let hours          = ["9-17", "8-12", "20-22"]
//    static let intervals      = ["Daily", "Weekly", "Monthly"]
    static let frequencies    = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    static let segueName      = "goToItems"
    static let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
}
