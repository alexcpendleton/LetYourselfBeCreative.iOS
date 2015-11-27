//
//  HardcodedTriadMaker.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class HardcodedTriadBuilder : TriadBuildable {
    var allWords:[String] = ["time","issue","year","side","people","kind","way","head","day","house","man","service","thing","friend","woman","father","life","power","child","hour","world","game","school","line","state","end","family","member","student","law","group","car","country","city","problem","community","hand","name","part","president","place","team","case","minute","week","idea","company","kid","system","body","program","information","question","back","work","parent","government","face","number","others","night","level","Mr","office","point","door","home","health","water","person","room","art","mother","war","area","history","money","party","story","result","fact","change","month","morning","lot","reason","right","research","study","girl","book","guy","eye","food","job","moment","word","air","business","teacher"]
    
    
    public func build() -> TriadModel {
        let result = TriadModel()
        
        let indices = 3.uniqueIndicesFrom(allWords)
        result.words.0 = allWords[indices[0]]
        result.words.1 = allWords[indices[1]]
        result.words.2 = allWords[indices[2]]
        
        return result
    }
}