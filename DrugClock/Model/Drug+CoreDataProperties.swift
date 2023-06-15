//
//  Drug+CoreDataProperties.swift
//  DrugClock
//
//  Created by Nurikk T. on 15.06.2023.
//
//

import Foundation
import CoreData


extension Drug {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drug> {
        return NSFetchRequest<Drug>(entityName: "Drug")
    }

    @NSManaged public var name: String?
    @NSManaged public var time: Date?

}

extension Drug : Identifiable {

}
