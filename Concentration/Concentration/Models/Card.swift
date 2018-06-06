//
//  Card.swift
//  Concentration
//
//  Created by rongc on 5/26/18.
//  Copyright © 2018 RongchangLei. All rights reserved.
//

import Foundation
//no inheritance
//struct - value type
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}


