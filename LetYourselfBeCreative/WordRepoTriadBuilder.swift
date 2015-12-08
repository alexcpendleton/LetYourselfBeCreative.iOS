//
//  WordRepoTriadBuilder.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class WordRepoTriadBuilder : TriadBuildable {
    let repos: (word: WordRepository, triad: TriadRepository)
    init(wordRepo: WordRepository, triadRepo: TriadRepository) {
        self.repos = (word: wordRepo, triad: triadRepo)
    }
    
    public func build() -> TriadModel {
        let result = TriadModel(entity: nil, changeHandler: self.changeHandler)
        let allWords = repos.word.all()
        let indices = 3.uniqueIndicesFrom(allWords)
        result.words = try! WordGroup(wordsToUse: indices.map { single(fromEntity: allWords[$0]) })
        
        return result
    }
    
    func changeHandler(sender: TriadModel) -> Void {
        let context = repos.triad.context
        if sender.starred {
            let created = Triad(context: context)
            let words = sender.words.array.map { $0.entity! }
            created.words = NSSet(array: words)
            sender.entity = created
        } else {
            if sender.entity != nil {
                context.deleteObject(sender.entity!)
                sender.entity = nil
            } else {
                print("Encountered an empty TriadModel.entity while trying to un-star. This should never actually happen...")
            }
        }
        try! context.save()
    }
    
    func single(fromEntity entity: Word) -> WordModel {
        return WordModel(word: entity.word!, relatedEntity: entity)
    }
}
/*
public class KnownTriadBuilder : TriadBuildable {
    let repo: TriadRepository
    init(repo: TriadRepository) {
        self.repo = repo
    }
    
    public func build() -> TriadModel {
        let result = TriadModel()
        if let fromDb = repo.all().first {
            if fromDb.words != nil {
                var wordModels = [WordModel]()
                for item in fromDb.words! {
                    if let knownWord = item as? Word {
                    wordModels.append(WordModel(word: knownWord.word!, relatedEntity: knownWord))
                    }
                }
                result.words = try! WordGroup(wordsToUse: wordModels)
                result.starred = true
            }
        }
        return result
    }
}
*/