//
//  Word.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/6/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import CoreData


@objc(Word)
class Word: NSManagedObject {
    static let EntityName = "Word"
// Insert code here to add functionality to your managed object subclass
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    convenience init(word: String, context: NSManagedObjectContext?) {
        let entity = NSEntityDescription.entityForName(Word.EntityName, inManagedObjectContext: context!)
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        self.word = word
    }
}

