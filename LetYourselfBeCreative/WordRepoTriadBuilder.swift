//
//  WordRepoTriadBuilder.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class WordRepoTriadBuilder : TriadBuildable {
    let repo: WordRepository
    init(repo: WordRepository) {
        self.repo = repo
    }
    
    public func build() -> TriadModel {
        let result = TriadModel()
        let allWords = repo.all()
        let indices = 3.uniqueIndicesFrom(allWords)
        result.words = try! WordGroup(wordsToUse: indices.map { single(fromEntity: allWords[$0]) })
        
        return result
    }
    
    func single(fromEntity entity: Word) -> WordModel {
        return WordModel(word: entity.word!, relatedEntity: entity)
    }
}