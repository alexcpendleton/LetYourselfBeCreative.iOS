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

public class TriadModel {
    public var words = ["", "", ""]
    
}

public protocol TriadMakeable {
    func make(numberOfWords: Int)->TriadModel
}

public class HardcodedTriadMaker : TriadMakeable {
    var allWords:[String] = ["time","issue","year","side","people","kind","way","head","day","house","man","service","thing","friend","woman","father","life","power","child","hour","world","game","school","line","state","end","family","member","student","law","group","car","country","city","problem","community","hand","name","part","president","place","team","case","minute","week","idea","company","kid","system","body","program","information","question","back","work","parent","government","face","number","others","night","level","Mr","office","point","door","home","health","water","person","room","art","mother","war","area","history","money","party","story","result","fact","change","month","morning","lot","reason","right","research","study","girl","book","guy","eye","food","job","moment","word","air","business","teacher"]
    
    
    public func make(numberOfWords: Int) -> TriadModel {
        let result = TriadModel()
        let randomizer = Randomization()
        let within = 0..<allWords.count-1
        print("within: ", within)
        let indices = randomizer.unique(numberOfWords, within: within)
        result.words = indices.map { print($0); return allWords[$0] }
        return result
    }
}

public class Randomization {
    public func single(within: Range<Int>) -> Int {
        let lower = within.startIndex
        let upper = within.endIndex
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    public func unique(amount: Int, within: Range<Int>) -> Set<Int> {
        var results = Set<Int>()
        while results.count < amount {
            results.insert(single(within))
        }
        return results
    }
}
