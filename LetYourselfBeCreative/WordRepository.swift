//
//  WordRepository.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import CoreData

class WordRepository : RepositoryBase<Word> {
    init(context: NSManagedObjectContext) {
        super.init(entityName: Word.EntityName, context: context)
    }
    
    func byText(texts:[String]) throws -> [Word] {
        let request = makeFetch()
        request.predicate = NSPredicate(format: "word in %@", texts)
        
        return try executeMultiFetch(request)
    }
}
