//
//  PresetData.swift
//  NotifApp2
//
//  Created by Maral on 17.02.22.
//

import Foundation
import RealmSwift

let mindfulnessList = ["Are you here now?",
                   "What are you thinking in this moment?",
                   "Take a long deep breath.",
                   "look outside the window for a moment",
                   "listen to the sounds around you",
                   "what are you experiencing right at this moment?"]
let motivationsList = ["You are doing a great job!",
                   "Keep moving forward, one step at a time",
                   "Success comes to those who persist!",
                   "Today, you are making your future!",
                    "I believe in you, keep going!"]
let gratitudesList = ["I am blessed by everything that I am and I have",
                "I have so many things to be thankful for every single day!",
                "Thank you universe for all the things that work right in my life and all the lessons I have to learn",
                "I am grateful for the people in my life"]

struct PresetData {
    let realm = try! Realm()
    
    func initiateData() {
        let mindfulness        = Category()
        let motivations           = Category()
        let gratitudes         = Category()
        mindfulness.category   = "Mindfulness"
        motivations.category      = "Motivations"
        gratitudes.category    = "Gratitudes"
//        let itemMindfulness1   = Item()
//        itemMindfulness1.title = "Are you here now?"
//        mindfulness.items.append(itemMindfulness1)
//
//        let itemMemories    = Item()
//        itemMemories.title  = "itemMemories"
//        memories.items.append(itemMemories)
//
//        let itemGratitudes2     = Item()
//        itemGratitudes2.title   = "itemGratitudes"
//        gratitudes.items.append(itemGratitudes2)
        iterate(lists: mindfulnessList, category: mindfulness)
        iterate(lists: motivationsList, category: motivations)
        iterate(lists: gratitudesList, category: gratitudes)
        
        

        try! realm.write {
            realm.add(mindfulness)
            realm.add(motivations)
            realm.add(gratitudes)
            
        }
    }

    func iterate(lists: [String], category: Category) {
        
        for sentence in lists {
            let item = Item()
            
            item.title  = sentence
            category.items.append(item)
}
        }

}
