//
//  WordGroup.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/6/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class WordGroup : CustomStringConvertible {
    public let allowableNumberOfWords = 3
    init(wordsToUse:[WordModel]) throws {
        self.array = [WordModel]()
        if wordsToUse.count != allowableNumberOfWords {
            throw WordGroupError.IncorrectCount
        }
        self.array = wordsToUse
    }
    public var array: [WordModel]
    
    public var description: String { get { return array.map{$0.text}.joinWithSeparator(", ") } }
}

public enum WordGroupError : ErrorType {
    case IncorrectCount
}