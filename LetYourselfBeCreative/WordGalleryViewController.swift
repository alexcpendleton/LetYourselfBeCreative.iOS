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
    
    public var modelPromise: Promise<WordGalleryModel>!
    private var model: WordGalleryModel?
    
    func setupFromModel() {
        navigationItem.title = model?.word
    }
    
    func handleFlickrError(flickrError: ErrorType)->Void {
        print("Error fetching from flickr: ", flickrError)
        let messager = SingleButtonAlertMessager()
        messager.showAlert("We ran into a problem fetching from Flickr. :(", title: "Uh oh!", presentUsing: self)
        
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        modelPromise.then { (data:WordGalleryModel) -> Promise<WordGalleryModel> in
            self.model = data
            self.setupFromModel()
            self.gallery.reloadData()
            return Promise<WordGalleryModel>(data)
        }.error(handleFlickrError)
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if model == nil { return 0 }
        return model!.imageLoaders.count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GalleryCell", forIndexPath: indexPath) as! WordGalleryCell
        
        let imagePromise = model?.imageLoaders[indexPath.row]
        if imagePromise != nil {
            imagePromise!.image().then { (image:UIImage?) -> Promise<UIImage?> in
                cell.image?.image = image
                cell.activityIndicator?.stopAnimating()
                return Promise<UIImage?>(image)
            }.error(handleFlickrError)
        }

        return cell
    }
}
