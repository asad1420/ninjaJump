//
//  mlCloud.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/28/16.
//  Copyright © 2016 Muhammad Asad. All rights reserved.
//

import Foundation
import SpriteKit

class mlCloud: SKShapeNode {
    
    init(size: CGSize){
    super.init()
    let path = CGPathCreateWithEllipseInRect(CGRect(x: 0, y:0, width: size.width, height:size.height), nil)
    self.path = path
    fillColor = UIColor.whiteColor()
    
        cloudMoving()
    }
    
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    func cloudMoving(){
    
        let cloudLeftMov = SKAction.moveByX(-10, y: 0, duration: 1)
        runAction(SKAction.repeatActionForever(cloudLeftMov))
       
        
    }


}
