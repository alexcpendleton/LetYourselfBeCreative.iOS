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
    init(entity: Triad?, changeHandler: TriadModelChanged) {
        self.entity = entity
        self.starredChangedHandler = changeHandler
    }
    public var words: WordGroup!
    public var starred: Bool = false {
        didSet {
            print("starred changed:", self)
            starredChangedHandler?(sender: self)
        }
    }
    var entity: Triad? = nil
    var starredChangedHandler: TriadModelChanged?
}