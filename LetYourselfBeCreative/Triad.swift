//
//  Triad.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/6/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import CoreData

@objc(Triad)
class Triad: NSManagedObject {
    static let EntityName = "Triad"
    // Insert code here to add functionality to your managed object subclass
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    convenience init(context: NSManagedObjectContext?) {
        let entity = NSEntityDescription.entityForName(Triad.EntityName, inManagedObjectContext: context!)
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
    }
    
    override func willSave() {
        print("/*******")
        print("Saving a triad")
        print("Number of words: ", words?.count)
        print(words!)
        print("*******/")
        super.willSave()
    }

}
