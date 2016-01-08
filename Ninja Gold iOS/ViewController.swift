//
//  ViewController.swift
//  Ninja Gold iOS
//
//  Created by Maric Sobreo on 1/8/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var goldEarnedLabel: UILabel!
    @IBOutlet weak var goldEarnedFromFarmLabel: UILabel!
    @IBOutlet weak var goldEarnedFromCaveLabel: UILabel!
    @IBOutlet weak var goldEarnedFromHouseLabel: UILabel!
    @IBOutlet weak var goldEarnedFromCasinoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideAllGoldEarnedButtonLabels()
        goldEarnedLabel.text = String(0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buildingButtonPressed(sender: UIButton) {
        let goldEarned: Int
        let farm = 1
        let cave = 2
        let house = 3
        // let casino = 4
        hideAllGoldEarnedButtonLabels()
        if sender.tag == farm {
            goldEarned = Int(arc4random_uniform(11) + 10)
            goldEarnedFromFarmLabel.text = generateAmountGoldEarnedText(goldEarned)
            goldEarnedFromFarmLabel.hidden = false
        } else if sender.tag == cave {
            goldEarned = Int(arc4random_uniform(6) + 5)
            goldEarnedFromCaveLabel.text = generateAmountGoldEarnedText(goldEarned)
            goldEarnedFromCaveLabel.hidden = false
        } else if sender.tag == house {
            goldEarned = Int(arc4random_uniform(4) + 2)
            goldEarnedFromHouseLabel.text = generateAmountGoldEarnedText(goldEarned)
            goldEarnedFromHouseLabel.hidden = false
            
        } else { //if sender.tag == casino {
            goldEarned = Int(arc4random_uniform(101)) - 50
            goldEarnedFromCasinoLabel.text = generateAmountGoldEarnedText(goldEarned)
            goldEarnedFromCasinoLabel.hidden = false
        }
        goldEarnedLabel.text = String(goldEarned + Int(goldEarnedLabel.text!)!)
    }

    @IBAction func resetButtonPressed(sender: UIButton) {
        goldEarnedLabel.text = String(0)
    }
    
    func hideAllGoldEarnedButtonLabels() {
        goldEarnedFromFarmLabel.hidden = true
        goldEarnedFromCaveLabel.hidden = true
        goldEarnedFromHouseLabel.hidden = true
        goldEarnedFromCasinoLabel.hidden = true
    }
    
    func generateAmountGoldEarnedText(gold: Int) -> String {
        if gold > 0 {
            return "You earned \(gold) golds"
        } else if gold == 0 {
            return "You did not earn any gold!"
        } else {
            return "You lost \(abs(gold)) golds"
        }
    }
}

