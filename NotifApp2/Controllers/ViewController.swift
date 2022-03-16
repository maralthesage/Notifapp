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
    
    let setFirstorSecondLaunch = LaunchTime()

    
    @IBOutlet weak var uLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setFirstorSecondLaunch.launchTime()
        
    }
    
    


}



