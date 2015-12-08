//
//  InitialDataFiller.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import CoreData

public class InitialDataFiller {
    let context: NSManagedObjectContext!
    var fillers: [InitiallyFillable]
    init(context: NSManagedObjectContext, fillers:[InitiallyFillable]) {
        self.context = context
        self.fillers = fillers
    }
    public func fillIfNecessary() {
        for item in fillers {
            if !item.hasBeenFilled() {
                item.fill()
            }
        }
    }
    
     static func smart(context: NSManagedObjectContext,
        wordRepo: WordRepository,
        triadRepo: TriadRepository) -> InitialDataFiller {
        var fillWith = [InitiallyFillable]()
        fillWith.append(InitialWords(wordRepo: wordRepo))
        fillWith.append(InitialTriads(wordRepo: wordRepo, triadRepo: triadRepo))
        return InitialDataFiller(context: context, fillers: fillWith)
    }
}
