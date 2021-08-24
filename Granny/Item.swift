//
//  Item.swift
//  My Granny
//
// created by Manoj Challagunda
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parntCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
