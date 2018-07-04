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
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards) //lazy cannot have didSet, no property observer
    
    var numberOfPairsOfCards: Int {
        //get{//readonly}
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        //property observer: everytime the flipCount instance updates, execute the didSet and update the label.
        didSet {
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    private var emojiChoices: Array<String> = ["🦄", "👻", "😈","👾","🎃","🎲"]
    private var emoji = Dictionary<Int, String>() //[Int:String]()
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card is not in the card buttons")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5507493575, blue: 0.2537739333, alpha: 1)
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
     
        }
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


