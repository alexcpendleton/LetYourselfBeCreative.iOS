//
//  WordGalleryViewController.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/26/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

public class WordGalleryViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var gallery: UICollectionView!
    
    public var model: WordGalleryModel!
    
    func setupFromModel() {
        navigationItem.title = model.word
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupFromModel()
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.imageLoaders.count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GalleryCell", forIndexPath: indexPath) as! WordGalleryCell
        
        let imagePromise = model.imageLoaders[indexPath.row]
        imagePromise.image().then { (image:UIImage?) -> Promise<UIImage?> in
            cell.image?.image = image
            return Promise<UIImage?>(image)
        }

        return cell
    }
}
