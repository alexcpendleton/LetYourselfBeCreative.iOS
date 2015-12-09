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
        let allWords = repos.word.all()
        let indices = 3.uniqueIndicesFrom(allWords)
        let result = buildFromTriadEntity(nil)
        result.words = try! WordGroup(wordsToUse: indices.map { singleWordModel(fromEntity: allWords[$0]) })
        
        return result
    }
    
    func buildFromTriadEntity(entity: Triad?) -> TriadModel {
        let starred = entity != nil
        let result = TriadModel(entity: entity, starred: starred)
        if entity != nil {
            var wordEntities = [WordModel]()
            for item in entity!.words! {
                if let wordEntity = item as? Word {
                    wordEntities.append(singleWordModel(fromEntity: wordEntity))
                } else {
                    print("/*******")
                    print("entity somehow wasn't a Word")
                    print(item)
                    print("*******/")
                }
            }
            result.words = try! WordGroup(wordsToUse: wordEntities)
        }
        return result
    }
    
    public func all() -> [TriadModel] {
        return repos.triad.all().map { buildFromTriadEntity($0) }
    }
    
    public func bookmark(triad: TriadModel) {
        let context = repos.triad.context
        let created = Triad(context: context)
        let words = triad.words.array.map { $0.entity! }
        created.words = NSSet(array: words)
        try! context.save()
    }
    
    public func unbookmark(triad: TriadModel) {
        let context = repos.triad.context
        if triad.entity != nil {
            context.deleteObject(triad.entity!)
        }
        try! context.save()
    }
    
    func singleWordModel(fromEntity entity: Word) -> WordModel {
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