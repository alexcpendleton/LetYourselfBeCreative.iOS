//
//  Word+CoreDataProperties.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/6/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Word {

    @NSManaged var word: String?
    @NSManaged var photos: NSManagedObject?

}
