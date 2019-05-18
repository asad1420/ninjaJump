//
//  wallGenerator.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/28/16.
//  Copyright © 2016 Muhammad Asad. All rights reserved.
//

import Foundation
import SpriteKit

class wallGenerator: SKSpriteNode {

    var wallInterval: NSTimer!
    var walls = [mlWall]()
    var wallTracker = [mlWall]()
    
    func startGeneratingWallInEverySecond(seconds: NSTimeInterval){
    
    wallInterval = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "walle", userInfo: nil, repeats: true)
        print(wallInterval)
    
    }
    func endGenWallTimer(){
       wallInterval.invalidate()
    }

   
    
    func walle() {
    
        var scale: CGFloat
        let rand = arc4random_uniform(2)
        
        if rand == 0 {
         scale = -1.0
        
        }else{
        scale = 1.0
        }
        let wall = mlWall()
        wall.position.x = size.width/2 + wall.size.width/2
        wall.position.y = scale * (kmlGroundHeight/2 + wall.size.height/2)
        walls.append(wall)
        wallTracker.append(wall)
        addChild(wall)
    }
    
    func stopMakingWalls(){
    endGenWallTimer()
        
        for wall in walls
        {
        
            wall.stop()
        
        }
    }
    
    
}