//
//  Randomization.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class Randomization {
    public func single(within: Range<Int>) -> Int {
        let lower = within.startIndex
        let upper = within.endIndex
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    public func unique(amount: Int, within: Range<Int>) -> Set<Int> {
        var results = Set<Int>()
        while results.count < amount {
            results.insert(single(within))
        }
        return results
    }
}