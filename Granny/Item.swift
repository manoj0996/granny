//
//  Item.swift
//  My Granny
//
//  Created by Sedenion technologies on 07/05/2020.
//  Copyright © 2020 Sedenion technologies. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parntCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
