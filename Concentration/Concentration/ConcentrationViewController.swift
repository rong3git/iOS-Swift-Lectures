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

class ConcentrationViewController: UIViewController {
    //this means "only callable from within this object"
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards) //lazy cannot have didSet, no property observer
    
    var numberOfPairsOfCards: Int {
        //get{//readonly}
        return (cardButtons.count + 1) / 2
    }
    
    //this means "this property is readable outside this object, but not settable."
    private(set) var flipCount = 0 {
        //property observer: everytime the flipCount instance updates, execute the didSet and update the label.
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0.5507493575, blue: 0.2537739333, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips:\(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:] //empty dictionary
            updateViewFromModel()
        }
    }
    
    //private var emojiChoices: [String] = ["🦄", "👻", "😈","👾","🎃","🎲"]
    private var emojiChoices = "🦄👻😈👾🎃🎲"
    private var emoji = [Card: String]() //Dictionary<Int, String>()
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
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
        //control + i => auto format code
        if cardButtons != nil {
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
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card] ?? "?"
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


