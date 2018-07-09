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
struct Card : Hashable {
    var hashValue: Int { return identifier }
    
    //protocol Equatable
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}


