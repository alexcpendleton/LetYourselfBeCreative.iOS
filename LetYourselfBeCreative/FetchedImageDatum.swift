//
//  FetchedImageDatum.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/7/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation

public struct FetchedImageDatum {
    init(nextPage: Int, uris: [String]) {
        nextPageIndex = nextPage
        urisForPage = uris
    }
    public var urisForPage: [String]
    public var nextPageIndex: Int
}