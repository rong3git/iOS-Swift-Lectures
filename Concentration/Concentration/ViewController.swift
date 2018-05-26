//
//  ViewController.swift
//  Concentration
//
//  Created by rongc on 5/25/18.
//  Copyright © 2018 RongchangLei. All rights reserved.
//

import UIKit

// function can be outside as global function, usually we don't do that.
// all instance variable called property - has to be initalize
// Swift - extremely type language

class ViewController: UIViewController {
    var flipCount = 0 {
        //property observer: everytime the flipCount instance updates, execute the didSet and update the label.
        didSet {
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    var emojiChoices: Array<String> = ["👻","🎃","👻","🎃"]
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            //nil - an optional is not set
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card is not in the card buttons")
        }
    }
    //MARK: Helper Method
    func flipCard(withEmoji emoji:String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) //color literal
            
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

