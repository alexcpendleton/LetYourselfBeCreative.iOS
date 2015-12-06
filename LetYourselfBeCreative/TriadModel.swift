//
//  TriadModel.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public class TriadModel {
    public var words: WordGroup!
    public var starred = false
    // todo: implement change detection
    
    // Triads don't exist when they're not starred,
    // so we create or delete as it changes
    
    private func onStarredChange() {
        if starred {
            create()
        } else {
            delete()
        }
    }
    
    private var entity: Triad?
    
    private func create() {
        entity = Triad()
        // TODO: Figure out words
        entity?.words = []
    }
    
    private func delete() {
        entity?.delete(self)
    }
}