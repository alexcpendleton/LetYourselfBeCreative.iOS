//
//  TriadModel.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
typealias TriadModelChanged = (sender: TriadModel)->Void

public class TriadModel  {
    init(entity: Triad?, starred: Bool) {
        self.entity = entity
        self.starred = starred
    }
    public var words: WordGroup!
    public var starred: Bool = false
    var entity: Triad?
}