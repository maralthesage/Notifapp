//
//  ViewController.swift
//  NotifApp2
//
//  Created by Maral on 09.02.22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let k = K()
    
    @IBOutlet weak var uiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    

}

