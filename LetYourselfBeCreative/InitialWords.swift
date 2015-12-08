//
//  InitialWords.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class InitialWords : InitiallyFillable {
    var wordRepo: WordRepository!
    init(wordRepo: WordRepository) {
        self.wordRepo = wordRepo
    }
    func theWords() -> [String] {
        return ["thread","staple","paper","can","headphones","speaker","pencil","paper clip","match","fork","spoon","knife","cup","flashlight","coin","scissors","blanket","coaster","zip tie","keyboard","mouse","wallet","money","book","cord","envelope","bowl","plate","pillow","shoe","lamp","coffee","hook","candle","dice","light bulb"]
    }
    
    
    func hasBeenFilled() -> Bool {
        return wordRepo.all().count > 0
    }
    
    func fill() {
        let words = theWords()
        for word in words {
            _ = Word(word: word, context: wordRepo.context)
        }
        try! wordRepo.context.save()
    }
}