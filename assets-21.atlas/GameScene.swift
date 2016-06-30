//
//  GameScene.swift
//  SushiNeko
//
//  Created by Buka Cakrawala on 6/30/16.
//  Copyright (c) 2016 Buka Cakrawala. All rights reserved.
//

import SpriteKit

enum Side {
    case Left, Right, None
}

class GameScene: SKScene {
    var sushiBasePiece: SushiPiece!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        sushiBasePiece = childNodeWithName("sushiBasePiece") as! SushiPiece!
        sushiBasePiece.connectChopSticks()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
            }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
