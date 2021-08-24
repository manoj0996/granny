//
//  Category.swift
//  My Granny
//
//  Created by Sedenion technologies on 07/05/2020.
//  Copyright © 2020 Sedenion technologies. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
   @objc dynamic var name: String = ""
@objc dynamic var colour: String = ""
    let items = List<Item>()
}
