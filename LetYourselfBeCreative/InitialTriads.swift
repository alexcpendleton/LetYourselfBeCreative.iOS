//
//  InitialTriads.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class InitialTriads : InitiallyFillable {
    let wordRepo: WordRepository
    let triadRepo: TriadRepository
    init(wordRepo: WordRepository, triadRepo: TriadRepository) {
        self.wordRepo = wordRepo
        self.triadRepo = triadRepo
    }
    
    func hasBeenFilled() -> Bool {
        return triadRepo.all().count > 0
    }
    
    func fill() {
        // These things should never realistically fail
        // (famous last words)
        let words = try! wordRepo.byText(["thread", "staple", "paper"])
        let created = Triad(context: triadRepo.context)
        created.words = NSSet(array: words)
        try! triadRepo.context.save()
    }
}
