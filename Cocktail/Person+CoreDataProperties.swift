//
//  Person+CoreDataProperties.swift
//  Cocktail
//
//  Created by Metehan kara on 9.06.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?

}
