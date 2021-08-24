//
//  Category.swift
//  My Granny
//
// created by Manoj Challagunda
//

import Foundation
import RealmSwift

class Category: Object {
   @objc dynamic var name: String = ""
@objc dynamic var colour: String = ""
    let items = List<Item>()
}
