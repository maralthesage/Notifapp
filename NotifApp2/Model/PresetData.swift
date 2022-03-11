//
//  PresetData.swift
//  NotifApp2
//
//  Created by Maral on 17.02.22.
//

import Foundation
import RealmSwift

let mindfulness = ["Are you here now?",
                   "What are you thinking in this moment?",
                   "Take a long deep breath.",
                   "look outside the window for a moment",
                   "listen to the sounds around you",
                   "what are you experiencing right at this moment?"]


class PresetData {
    let realm = try! Realm()
    func initiateData() {
        let mindfulness = Category()
        let memories = Category()
        let gratitudes = Category()
        mindfulness.category = "Mindfulness"
        memories.category = "Memories"
        gratitudes.category = "Gratitudes"
        let itemMindfulness1 = Item()
        itemMindfulness1.title = "Are you here now?"
        mindfulness.items.append(itemMindfulness1)



        try! realm.write {
            realm.add(mindfulness)
            realm.add(memories)
            realm.add(gratitudes)
            
        }
    }

}
