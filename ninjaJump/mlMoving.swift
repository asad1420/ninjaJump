//
//  mlMoving.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/27/16.
//  Copyright © 2016 Muhammad Asad. All rights reserved.
//

import Foundation
import SpriteKit

class mlMoving: SKSpriteNode {

    let Number_of_Segments = 20
    let firstColor = UIColor(red: 88/255, green: 144/255, blue: 180/255, alpha: 1.0)
    let secondColor = UIColor(red: 200/255, green: 120/255, blue: 180/255, alpha: 1.0)
    
    
    
    init(size: CGSize){
    super.init(texture: nil, color: UIColor.brownColor(), size: CGSizeMake(size.width*2, size.height))
    anchorPoint = CGPointMake(0, 0.5)
        
      for var i=0; i < Number_of_Segments; i++ {
        
            var segmentColor: UIColor!
        
            if i%2 == 0{
            segmentColor = firstColor
            }
            else{
            segmentColor = secondColor
            }
        let segment = SKSpriteNode(color: segmentColor, size: CGSizeMake(self.size.width / CGFloat(Number_of_Segments), self.size.height) )
        segment.anchorPoint = CGPointMake(0, 0.5)
        segment.position = CGPointMake(CGFloat(i)*segment.size.width, 0)
        addChild(segment)
        
        }
        
    }
    
    func start(){
    
    let adjustTime = NSTimeInterval(frame.size.width / kDefaultXtoMovePerSec)
        
    let move = SKAction.moveByX(-frame.size.width/2, y: 0, duration: adjustTime/2)
    let reset = SKAction.moveToX(0, duration: 0)
    
   let sequence = SKAction.sequence([move,reset])
        runAction(SKAction.repeatActionForever(sequence))
    
    
    }
    func stop(){
    
        removeAllActions()
    
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}