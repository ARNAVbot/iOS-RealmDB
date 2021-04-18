//
//  Item.swift
//  Todoey
//
//  Created by Arnav Agarwal on 14/04/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    
    // creating inverse relationship to category
    // property refers to the forward relationship that this file represensts in the parent class
    var parentCategory = LinkingObjects(fromType: Categoryyy.self, property: "items")
}
