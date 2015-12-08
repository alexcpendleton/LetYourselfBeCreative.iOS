//
//  WordRepository.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import CoreData

public class WordRepository {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    internal func all() -> [Word] {
        let request = makeFetch()
        var results = [Word]()
        do {
            let fetched = try executeMultiFetch(request)
            results.appendContentsOf(fetched)
        } catch {
            print("There was an error fetching all the words. It was suppressed and no results were returned.")
        }
        return results
    }
    
    private func executeMultiFetch(request: NSFetchRequest) throws -> [Word] {
        return try context.executeFetchRequest(request) as! [Word]
    }
    private func makeFetch()-> NSFetchRequest { return NSFetchRequest(entityName: Word.EntityName) }
}