//
//  Data.swift
//  Todoey
//
//  Created by Arnav Agarwal on 14/04/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    // dynamic keyword basically tells to monitor the property 'name' to be monitored at runtime
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
