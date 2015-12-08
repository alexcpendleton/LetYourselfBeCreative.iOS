//
//  HardcodedWordGalleryBuilder.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit
import DRImagePlaceholderHelper

public class HardcodedWordGalleryBuilder : WordGalleryBuildable {
    public lazy var placeholderSource = { DRImagePlaceholderHelper.sharedInstance() as! DRImagePlaceholderHelper }()
    public lazy var imageSize = { return CGSize(width: 600, height: 1000) }()
    public lazy var maxImages = { return 10 }()
    
    public func build(word: String) -> Promise<WordGalleryModel> {
        
        let result = WordGalleryModel()
        result.word = word
        result.imageLoaders = [PromisedImage]()
        for i in 0...maxImages {
            let text = "PH#\(i)"
            let ph = placeholderSource.placerholderImageWithSize(imageSize, text: text, fillColor: UIColor.cyanColor())
            result.imageLoaders.append(PromisedImage(fetcher: Promise<UIImage?>(ph)))
        }
        return Promise<WordGalleryModel>(result)
    }
}