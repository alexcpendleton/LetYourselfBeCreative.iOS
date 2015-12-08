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
    init(context: NSManagedObjectContext) {
        self.context = context
        self.wordRepo = WordRepository(context: context)
    }
    var wordRepo: WordRepository!

    public func fillIfNecessary() {
        if !hasBeenFilled() {
            fillWords()
        }
    }
    
    func hasBeenFilled() -> Bool {
        return wordRepo.all().count > 0
    }
    
    func fillWords() {
        let words = InitialWords().theWords()
        for word in words {
            _ = Word(word: word, context: context)
        }
        try! context.save()
    }
}