//
//  SushiPiece.swift
//  SushiNeko
//
//  Created by Buka Cakrawala on 6/30/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import SpriteKit

class SushiPiece: SKSpriteNode {
    
    var side: Side = .None {
        didSet {
            switch side {
            case .Left:
                //show left chopstick
                leftChopStick.hidden = false
            case .Right:
                //show right chopstick
                rightChopStick.hidden = false
            case .None:
                //Hide all chopsticks
                leftChopStick.hidden = true
                rightChopStick.hidden = true
            }
        }
    }

    //chopsticks object
    var leftChopStick: SKSpriteNode!
    var rightChopStick: SKSpriteNode!
    
    //this is required in order for the subclass to work
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    //this is required in order for the subclass to work
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func connectChopSticks() {
        //connect the chopstick nodes
        leftChopStick = childNodeWithName("leftChopStick") as! SKSpriteNode!
        rightChopStick = childNodeWithName("rightChopStick") as! SKSpriteNode!
        
        //set the default side of the chopstick
        side = .None
    }
}





