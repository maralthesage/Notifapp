//
//  DatePickerVC.swift
//  NotifApp2
//
//  Created by Maral on 22.02.22.
//

import UIKit

class IntervalPicker: UIViewController {

    @IBOutlet weak var intervalPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 10
        } else {
            return 100
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "First \(row)"
        } else {
            return "Second \(row)"
        }
    }
}
