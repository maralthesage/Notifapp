//
//  Item.swift
//  NotifApp2
//
//  Created by Maral on 16.02.22.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String  = ""
    var parentCategory               = LinkingObjects(fromType: Category.self, property: "items")

}

