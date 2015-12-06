//
//  TriadsViewController.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 11/25/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import UIKit

public class TriadsViewController : UIViewController {
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var word2: UILabel!
    @IBOutlet weak var word3: UILabel!
    @IBOutlet weak var star: UIBarButtonItem!
    
    public var model: TriadModel!
    public var galleryPreparer: WordGalleryViewControllerPreparer!
    public var builder: TriadBuildable!
    
    let wordGallerySegueID = "TriadToWordGallerySegue"
    
    @IBAction func againRequested(sender: AnyObject) {
        makeNewTriad(true)
    }
    
    @IBAction func starTogglePressed(sender: AnyObject) {
        model.starred = !model.starred
        updateStarFromModel()
    }
    
    func wordLongPressed(sender: UIGestureRecognizer) {
        if sender.state == .Began {
            if let label = sender.view as? UILabel {
                segueToWordGallery(label)
            }
        }
    }
    
    private func segueToWordGallery(sender: UILabel) {
        performSegueWithIdentifier(wordGallerySegueID, sender: sender.text)
    }
    public override func viewDidLoad() {
        // TODO: Get some DI going on here
        let app = AppDelegate.sharedInstance()
        galleryPreparer = app.galleryPreparer
        builder = app.triadBuilder
        super.viewDidLoad()
    }
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if model == nil {
            makeNewTriad(false)
        }
        setupFromModel()
    }
    
    func addPressRecognizer(toLabel: UILabel) {
        toLabel.addGestureRecognizer(
            UILongPressGestureRecognizer(target: self, action: "wordLongPressed:"))
    }
    
    func setupFromModel() {
        word1.text = model.words.0
        word2.text = model.words.1
        word3.text = model.words.2
        [word1, word2, word3].forEach { addPressRecognizer($0) }
        updateStarFromModel()
    }
    
    func makeNewTriad(updateUI: Bool) {
        model = builder.build()
        if updateUI {
            setupFromModel()
        }
    }
    
    func updateStarFromModel() {
        let starImageName = model.starred ? "Star Filled" : "Star"
        star.image = UIImage(named: starImageName)
    }
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == wordGallerySegueID {
            if let wordForSegue = sender as? String {
                galleryPreparer.prepare(wordForSegue, from: segue.destinationViewController)
            }
        }
    }
}

