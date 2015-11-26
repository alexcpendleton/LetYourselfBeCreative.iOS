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
    @IBOutlet weak var againTrigger: UIButton!
    
    public var model: TriadModel!
    
    @IBAction func againRequested(sender: AnyObject) {
        makeNewTriad(true)
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if model == nil {
            makeNewTriad(false)
        }
        setupFromModel()
        
    }
    
    func setupFromModel() {
        word1.text = model.words[0]
        word2.text = model.words[1]
        word3.text = model.words[2]
    }
    
    let maker: TriadMakeable = HardcodedTriadMaker()
    func makeNewTriad(updateUI: Bool) {
        model = maker.make(3)
        if updateUI {
            setupFromModel()
        }
    }
}



