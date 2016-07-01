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
    var character: Character!
    //var sushi tower
    var sushiTower: [SushiPiece] = []
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        sushiBasePiece = childNodeWithName("sushiBasePiece") as! SushiPiece!
        sushiBasePiece.connectChopSticks()
        character = childNodeWithName("character") as! Character
        
        //Manually stack the start of the tower
        addTowerPiece(.None)
        addTowerPiece(.Right)
        addRandomPieces(10)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        for touch in touches {
            //Get touch position in scene
            let location = touch.locationInNode(self)
            
            //was touch on left or right of the screen
            if location.x > size.width / 2 {
                character.side = .Right
            } else {
                character.side = .Left
            }
            /* Grab sushi piece on top of the base sushi piece, it will always be 'first' */
            let firstPiece = sushiTower.first as SushiPiece!
            
            /* Remove from sushi tower array */
            sushiTower.removeFirst()
            firstPiece.flip(character.side)
            
            /* Add a new sushi piece to the top of the sushi tower */
            addRandomPieces(1)
            /* Drop all the sushi pieces down one place */
            for node:SushiPiece in sushiTower {
                node.runAction(SKAction.moveBy(CGVector(dx: 0, dy: -55), duration: 0.10))
                
                /* Reduce zPosition to stop zPosition climbing over UI */
                node.zPosition -= 1
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func addTowerPiece(side: Side) {
        /* Add a new sushi piece to the sushi tower */
        
        /* Copy original sushi piece */
        let newPiece = sushiBasePiece.copy() as! SushiPiece
        newPiece.connectChopSticks()
        
        /* Access last piece properties */
        let lastPiece = sushiTower.last
        
        /* Add on top of last piece, default on first piece */
        let lastPosition = lastPiece?.position ?? sushiBasePiece.position
        newPiece.position = lastPosition + CGPoint(x: 0, y: 55)
        
        /* Increment Z to ensure it's on top of the last piece, default on first piece*/
        let lastZPosition = lastPiece?.zPosition ?? sushiBasePiece.zPosition
        newPiece.zPosition = lastZPosition + 1
        
        /* Set side */
        newPiece.side = side
        
        /* Add sushi to scene */
        addChild(newPiece)
        
        /* Add sushi piece to the sushi tower */
        sushiTower.append(newPiece)
    }
    func addRandomPieces(total: Int) {
        //add random pieces to sushi tower
        for _ in 1...total {
            //need to access last piece properties
            let lastPiece = sushiTower.last as SushiPiece!
            //Make sure we don't create imposible sushi structure
            if lastPiece.side != .None {
                addTowerPiece(.None)
            } else {
                //Random number genrator
                let rand = CGFloat.random(min: 0, max: 1.0)
                
                if rand < 0.45 {
                    //45 percent to get the left side
                    addTowerPiece(.Left)
                } else if rand < 0.9 {
                    //90 percent to get the right side
                    addTowerPiece(.Right)
                } else {
                    //only 10 percent
                    addTowerPiece(.None)
                }
            }
        }
    }
}



























