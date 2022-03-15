//
//  DatePickerVC.swift
//  NotifApp2
//
//  Created by Maral on 22.02.22.
//

import UIKit
import RealmSwift

class IntervalPicker: UIViewController {
    
    //    var selectedRow: Int = 0
    var category: Category?
    //    var uiFreqPicker: String = ""
    //    var uiRepeatsPicker: String = ""
    //    var uiHourPicker: String = ""
    
    let realm = try! Realm()
    
    @IBOutlet weak var freqPicker: UIPickerView!
    @IBOutlet weak var startAndEndPicker: UIPickerView!
    
    
    
    let freq = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    let repeats = ["Daily",
                   "Weekly",
                   "Monthly"]
    
    let hours = ["9-17", "8-12", "20-22"]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        freqPicker.delegate   = self
        freqPicker.dataSource = self
        startAndEndPicker.delegate = self
        startAndEndPicker.dataSource = self
        
        
        if let selectedFreq = category?.freqs {
            freqPicker.selectRow(selectedFreq, inComponent: 0, animated: true)
            
        } else {
            freqPicker.selectRow(1, inComponent: 0, animated: true)
            
        }
        if let interval = category?.intervals {
            freqPicker.selectRow(interval, inComponent: 1, animated: true)
            
        } else {
            freqPicker.selectRow(1, inComponent: 1, animated: true)
            
        }
        if let hour = category?.hours {
            startAndEndPicker.selectRow(hour, inComponent: 0, animated: true)
            
        } else {
            startAndEndPicker.selectRow(1, inComponent: 0, animated: true)
            
        }
    }
    
    
    
    
    @IBAction func setButton(_ sender: UIButton) {

        navigationController?.popViewController(animated: true)
        
        if let currentCategory = category {
            do {
                try realm.write {
                    currentCategory.freqs = freqPicker.selectedRow(inComponent: 0)
                    currentCategory.intervals = freqPicker.selectedRow(inComponent: 1)
                    currentCategory.hours = startAndEndPicker.selectedRow(inComponent: 0)
                }
                
            }
            catch {
                fatalError("couldn't write the interval picker data to realm")
            }
        }
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension IntervalPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        if pickerView == freqPicker {
            return 2
            
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == freqPicker {
            if component == 0 {
                return freq.count
                
            } else {
                return repeats.count
            }
            
        } else {
            return hours.count
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == freqPicker {
            if component == 0 {
                return freq[row]
                
            } else{
                return repeats[row]
            }
        } else {
            
            return hours[row]
            
        }
        
    }
    
    
}

