//
//  cloudGenerator.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/28/16.
//  Copyright © 2016 Muhammad Asad. All rights reserved.
//

import Foundation
import SpriteKit

class cloudGenerator: SKSpriteNode {

    let cloud_width: CGFloat = 125.0
    let cloud_height: CGFloat = 55.0
    var cloudInterval: NSTimer!
    
    func cloudGenerate(num: Int){
        
        for var i=0; i<num; i++ {
        
            let cloud = mlCloud(size: CGSizeMake(cloud_width, cloud_height))
            let x = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width/2
            let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
            
            cloud.position = CGPointMake(x, y)
            cloud.zPosition = -1
            addChild(cloud)
        }
    
    }
    
    func startGeneratingSpwanTime(seconds: NSTimeInterval){
    cloudInterval = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "continuesCloudMaking", userInfo: nil, repeats: true)
    print(cloudInterval)
    }
    
    
    func continuesCloudMaking(){
    
        let x = size.width/2 + cloud_width/2
        let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
        let cloud = mlCloud(size: CGSizeMake(cloud_width, cloud_height))
        cloud.position = CGPointMake(x, y)
        cloud.zPosition = -1
        addChild(cloud)
    
    }
    
    func cloudStop(){
                 cloudInterval.invalidate()
    }
    
    

}