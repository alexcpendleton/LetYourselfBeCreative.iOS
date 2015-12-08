//
//  RepositoryBase.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import CoreData

class RepositoryBase<EntityType: NSManagedObject> {
    let context: NSManagedObjectContext
    let entityName: String
    init(entityName: String, context: NSManagedObjectContext) {
        self.entityName = entityName
        self.context = context
    }
    
    internal func all() -> [EntityType] {
        let request = makeFetch()
        var results = [EntityType]()
        do {
            let fetched = try executeMultiFetch(request)
            results.appendContentsOf(fetched)
        } catch {
            print("There was an error fetching all the words. It was suppressed and no results were returned.")
        }
        return results
    }
    
    internal func executeMultiFetch(request: NSFetchRequest) throws -> [EntityType] {
        return try context.executeFetchRequest(request) as! [EntityType]
    }
    internal func makeFetch()-> NSFetchRequest { return NSFetchRequest(entityName: self.entityName) }
}