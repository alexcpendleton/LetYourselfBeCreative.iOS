//
//  InitiallyFillable.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

protocol InitiallyFillable {
    func hasBeenFilled()->Bool
    func fill()
}