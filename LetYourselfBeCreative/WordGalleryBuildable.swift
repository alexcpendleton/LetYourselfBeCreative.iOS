//
//  WordGalleryBuildable.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import PromiseKit

public protocol WordGalleryBuildable {
    func build(word: String) -> Promise<WordGalleryModel>
}