//
//  TriadRepository.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import CoreData

class TriadRepository : RepositoryBase<Triad> {
    init(context: NSManagedObjectContext) {
        super.init(entityName: Triad.EntityName, context: context)
    }
}