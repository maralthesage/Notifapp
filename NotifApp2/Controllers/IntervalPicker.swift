//
//  DatePickerVC.swift
//  NotifApp2
//
//  Created by Maral on 22.02.22.
//

import UIKit
import RealmSwift

class IntervalPicker: UIViewController {
    

    var category: Category?
    let realm = try! Realm()
    
    let freq = K.frequencies
//    let repeats = K.intervals
    let hours = K.hours
    
    @IBOutlet weak var freqPicker: UIPickerView!
//    @IBOutlet weak var startAndEndPicker: UIPickerView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        freqPicker.delegate          = self
        freqPicker.dataSource        = self
//        startAndEndPicker.delegate   = self
//        startAndEndPicker.dataSource = self
        
        
        if let selectedFreq = category?.freqs {
            freqPicker.selectRow(selectedFreq, inComponent: 0, animated: true)
            
        } else {
            freqPicker.selectRow(1, inComponent: 0, animated: true)
            
        }
        if let hour = category?.hours {
            freqPicker.selectRow(hour, inComponent: 1, animated: true)
            
        } else {
            freqPicker.selectRow(1, inComponent: 1, animated: true)
            
        }
//        if let hour = category?.hours {
//            startAndEndPicker.selectRow(hour, inComponent: 0, animated: true)
//
//        } else {
//            startAndEndPicker.selectRow(1, inComponent: 0, animated: true)
//
//        }
    }
    
    
    

//MARK: - SetButton IBAction
    
    
    @IBAction func setButton(_ sender: UIButton) {

        navigationController?.popViewController(animated: true)
        
        if let currentCategory = category {
            do {
                try realm.write {
                    currentCategory.freqs     = freqPicker.selectedRow(inComponent: 0)
                    currentCategory.hours = freqPicker.selectedRow(inComponent: 1)
//                    currentCategory.hours     = startAndEndPicker.selectedRow(inComponent: 0)
                }
                
            }
            catch {
                fatalError("couldn't write the interval picker data to realm")
            }
        }
        dismiss(animated: true, completion: nil)
        
    }
    
}






//MARK: - UIPickerView DataSource And Delegate Extension

extension IntervalPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        if pickerView == freqPicker {
            return 2
        }
        else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
//        if pickerView == freqPicker {
            if component == 0 {
                return freq.count
                
            } else {
                return hours.count
            }
            
//        } else {
//            return hours.count
//        }
//
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
//        if pickerView == freqPicker {
            if component == 0 {
                return freq[row]
                
            } else {
                return hours[row]
            }
            
//        } else {
//                return hours[row]
//
//        }
        
    }
    
    
}

