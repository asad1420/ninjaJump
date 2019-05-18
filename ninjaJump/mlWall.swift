//
//  mlWall.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/28/16.
//  Copyright © 2016 Muhammad Asad. All rights reserved.
//

import Foundation
import SpriteKit

class mlWall: SKSpriteNode {
    
    let wall_width: CGFloat = 30.0
    let wall_height: CGFloat = 44.0
    let wall_color = UIColor.blackColor()
    
    init(){
        let size = CGSizeMake(wall_width, wall_height)
        super.init(texture: nil, color: wall_color, size: size)
        
        wallMoving()
        physicsBodywithSize(size)
        
    }
    
    func wallMoving(){
        
        let wall = SKAction.moveByX(-kDefaultXtoMovePerSec, y: 0, duration: 1.0)
        runAction(SKAction.repeatActionForever(wall))
        
    }
    
    func physicsBodywithSize(size: CGSize){
        
            physicsBody = SKPhysicsBody(rectangleOfSize: size)
            physicsBody!.categoryBitMask = wallPhy
            physicsBody!.affectedByGravity = false
            
    }
    func stop(){
      
     removeAllActions()
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}