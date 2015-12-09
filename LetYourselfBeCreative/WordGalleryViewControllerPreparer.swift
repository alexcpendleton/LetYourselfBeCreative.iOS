//
//  WordGalleryViewControllerPreparer.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/27/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import UIKit

public class WordGalleryViewControllerPreparer {
    let builder: WordGalleryBuildable
    init(galleryBuilder: WordGalleryBuildable) {
        self.builder = galleryBuilder
    }
    
    func prepare(word: String, from:UIViewController) -> WordGalleryViewController {
        let result = from as! WordGalleryViewController
        prepare(word, with: result)
        return result
    }
    
    func prepare(word: String, with: WordGalleryViewController) {
        with.modelPromise = builder.build(word)
    }
}

