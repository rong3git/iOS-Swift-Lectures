//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by rongc on 7/23/18.
//  Copyright © 2018 Rongchang Lei. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    var backgroundImage: UIImage? { didSet {setNeedsDisplay()}}
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
}
