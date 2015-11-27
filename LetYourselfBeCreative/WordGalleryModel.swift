//
//  WordGalleryModel.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import PromiseKit
import UIKit

public class WordGalleryModel {
    public var word:String = ""
    public var imageLoaders: [PromisedImage]!
}

public class PromisedImage {
    private var fetcher: Promise<UIImage?>
    private var loadedImage: UIImage?
    private var hasBeenLoaded = false
    
    init(fetcher:Promise<UIImage?>) {
        self.fetcher = fetcher
    }
    
    public func image() -> Promise<UIImage?> {
        if hasBeenLoaded {
            return Promise<UIImage?>(loadedImage)
        } else {
            return fetcher.then { (fetched:UIImage?) -> Promise<UIImage?> in
                self.loadedImage = fetched
                self.hasBeenLoaded = true
                return Promise<UIImage?>(fetched)
            }
        }
    }
}