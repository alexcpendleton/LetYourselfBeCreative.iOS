//
//  FlickrWordGalleryBuilder.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import PromiseKit

class FlickrWordGalleryBuilder : WordGalleryBuildable {
    let fetcher: FlickrImageFetcher
    init(fetcher: FlickrImageFetcher) {
        self.fetcher = fetcher
    }
    var pageSize: Int = 15
    func build(word: String) -> Promise<WordGalleryModel> {
        let results = WordGalleryModel()
        results.imageLoaders = [PromisedImage]()
        results.word = word
        return fetcher.images(word, pageIndex: 1, pageSize: pageSize).then  { (data:FetchedImageDatum) -> Promise<WordGalleryModel> in
            for uri in data.urisForPage {
                results.imageLoaders.append(self.promiseImage(uri))
            }
            return Promise<WordGalleryModel>(results)
        }
    }
    
    func promiseImage(from: String) -> PromisedImage {
        let imageRequest: NSURLRequest = NSURLRequest(URL: NSURL(string: from)!)
        return PromisedImage(fetcher: NSURLSession.sharedSession().promise(imageRequest).then({ (data:NSData) -> Promise<UIImage?> in
            let image = UIImage(data: data)
            return Promise<UIImage?>(image)
        }))
    }
}