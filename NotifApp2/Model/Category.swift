//
//  Category.swift
//  NotifApp2
//
//  Created by Maral on 16.02.22.
//


import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var category : String  = ""
    @objc dynamic var freqs    : Int     = 0
//    @objc dynamic var intervals: Int     = 0
    @objc dynamic var hours    : Int     = 0
    

    let items = List<Item>()
    
}
