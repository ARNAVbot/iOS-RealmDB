//
//  Categoryyy.swift
//  Todoey
//
//  Created by Arnav Agarwal on 14/04/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Categoryyy: Object {
    @objc dynamic var name: String = ""
    
    // creating relationships to items
    let items = List<Item>()
}
