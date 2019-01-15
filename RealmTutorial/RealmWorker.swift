//
//  RealmWorker.swift
//  RealmTutorial
//
//  Created by Simina Popescu on 14/01/2019.
//  Copyright © 2019 SiminaTutorials. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWorker {
    
    private let realm = try? Realm()
    
    func allLocations() -> Results<Location>? {
        return realm?.objects(Location.self).sorted(byKeyPath: Location.SortBy.name.rawValue) ?? .none
    }
    
    func createLocation(with name: String, description: String, imagePath: String) {
        let location = Location(name: name, description: description, imagePath: imagePath)
        create(the: location)
    }
    
    func create(the location: Location) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                realm.add(location)
            }
        } catch let error {
            print(error)
        }
    }
    
    func remove(location: Location) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                realm.delete(location)
            }
        } catch let error {
            print(error)
        }
    }
    
    func removeAll() {
        guard let realm = realm else { return }
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch let error {
            print(error)
        }
    }
    
    func update(location: Location) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                // it works only when you use primary key
                realm.add(location, update: true)
            }
        } catch let error {
            print(error)
        }
    }
}
