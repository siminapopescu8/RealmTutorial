//
//  Location.swift
//  RealmTutorial
//
//  Created by Simina Popescu on 14/01/2019.
//  Copyright © 2019 SiminaTutorials. All rights reserved.
//

import Foundation
import RealmSwift

class Location: Object {
    enum SortBy: String {
        case name, locationDescription
    }
    
    // read only proprieties are automatically ignored (with get)
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    @objc dynamic var locationDescription: String = ""
    @objc dynamic var imagePath: String = ""
    
    convenience init(name: String, description: String, imagePath: String) {
        self.init()
        self.name = name
        self.locationDescription = description
        self.imagePath = imagePath
    }
    
    // you can add primary key
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // or indexing properties -> It’s best to only add indexes when you’re optimizing the read performance for specific situations.
//    override static func indexedProprieties() -> [String] {
//        return ["name"]
//    }
    
    // ignoring properties -> if you don't want to save a field in your model
//    override static func ignoredProperties() -> [String] {
//        return ["temporaryID"] // for example a temporary id
//    }
}

// MARK: - Comparable extension
extension Location: Comparable {
    static func < (lhs: Location, rhs: Location) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name
    }
}
