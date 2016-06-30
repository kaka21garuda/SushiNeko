//
//  Character.swift
//  SushiNeko
//
//  Created by Buka Cakrawala on 6/30/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import SpriteKit

class Character: SKSpriteNode {
   //character side
    var side: Side = .Left {
        didSet {
            if side == .Left {
                xScale = 1
                position.x = 1
            } else {
                //to flip an asset horizontally is to invert the x axis
                xScale = -1
                position.x = 252
            }
        }
    }
    
    //required for your subclass to work
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
