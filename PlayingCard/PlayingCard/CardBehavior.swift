//
//  CardBehavior.swift
//  PlayingCard
//
//  Created by rongc on 7/19/18.
//  Copyright © 2018 RongchangLei. All rights reserved.
//

import UIKit

class CardBehavior: UIDynamicBehavior {
    //1
    lazy var collisionBehavior: UICollisionBehavior = {
        let behavior = UICollisionBehavior()
        behavior.translatesReferenceBoundsIntoBoundary = true
 
        return behavior
    }()
    
    //2
    lazy var itemBehavior: UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.allowsRotation = false
        behavior.elasticity = 1.0
        behavior.resistance = 0
  
        return behavior
    }()
    
    private func push(_ item: UIDynamicItem) {
        //3
        let push = UIPushBehavior(items: [item], mode: .instantaneous)
        push.angle = CGFloat(Int(2 * CGFloat.pi).arc4random)
        push.magnitude = CGFloat(1.0) + CGFloat(Int(2.0).arc4random)
        //clean up
        push.action = { [unowned push, weak self] in
            self?.removeChildBehavior(push)
        }
        addChildBehavior(push)
    }
    
    func addItem(_ item: UIDynamicItem) {
        collisionBehavior.addItem(item)
        itemBehavior.addItem(item)
        push(item)
    }
    
    func removeItem(_ item: UIDynamicItem) {
        collisionBehavior.removeItem(item)
        itemBehavior.removeItem(item)
    }
    
    
    override init() {
        super.init()
        addChildBehavior(collisionBehavior)
        addChildBehavior(itemBehavior)
    }
    
    convenience init(in animator: UIDynamicAnimator) {
        self.init()
        animator.addBehavior(self)
    }    
}
