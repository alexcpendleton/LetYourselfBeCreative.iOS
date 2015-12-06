//
//  WordModel.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/6/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class WordModel : CustomStringConvertible {
    init(word: String) {
        text = word
    }
    public var text: String = ""
    
    public var description: String { get { return text } }
}