//
//  BookmarkedTriadsViewController.swift
//  LetYourselfBeCreative
//
//  Created by Alex Pendleton on 12/8/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

public class BookmarkedTriadsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    var model: BookmarkedTriadsModel?
    @IBOutlet weak var table: UITableView!
    var wordDelimiter = " | "
    
    override public func viewWillAppear(animated: Bool) {
        model = BookmarkedTriadsModel(triads: AppDelegate.sharedInstance().triadBuilder.all())
        table.reloadData()
        super.viewWillAppear(animated)
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = model!.triads[indexPath.row]
        presentTriad(item)
    }
    
    func presentTriad(triad: TriadModel) {
        if let toPresent = storyboard!.instantiateViewControllerWithIdentifier("TriadsViewController") as? TriadsViewController {
            toPresent.model = triad
            navigationController?.pushViewController(toPresent, animated: true)
        }
    }
    
    @IBAction func newTriadRequested(sender: AnyObject) -> Void {
        presentNewTriad()
    }
    
    func presentNewTriad() {
        let triad = AppDelegate.sharedInstance().triadBuilder.build()
        presentTriad(triad)
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model == nil { return 0 }
        return model!.triads.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookmarkedTriadCell") as UITableViewCell!
        
        let item = model!.triads[indexPath.row]
        // set cell's textLabel.text property
        // set cell's detailTextLabel.text property
        cell.textLabel?.text = item.words.array.map { $0.text }.joinWithSeparator(wordDelimiter)
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        return cell
    }
}

import PromiseKit
class BookmarkedTriadsModel {
    var triads: [TriadModel]
    init(triads: [TriadModel]) {
        self.triads = triads
    }
}