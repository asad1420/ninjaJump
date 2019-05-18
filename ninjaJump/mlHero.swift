//
//  mlHero.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/27/16.
//  Copyright © 2016 Muhammad Asad. All rights reserved.
//

import Foundation
import SpriteKit

class mlHero: SKSpriteNode{

    var body: SKSpriteNode!
    var arms: SKSpriteNode!
    var leftLeg: SKSpriteNode!
    var rightLeg: SKSpriteNode!
    var isUpSideDown: Bool = false
    
    init(){
        
        let size = CGSizeMake(33, 44)
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        
        bodyHero()
        physicsBodywithSize(size)
    
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bodyHero(){
        body = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.frame.size.width, 40))
        body.position = CGPointMake(0, 2)
        addChild(body)
        
        let skinColor = UIColor(red: 207.0/255.0, green: 193.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        let face = SKSpriteNode(color: skinColor, size: CGSizeMake(self.frame.size.width, 12))
        face.position = CGPointMake(0, 6)
        addChild(face)
        
        let eyeColor = UIColor.whiteColor()
        let leftEye = SKSpriteNode(color: eyeColor, size: CGSizeMake(6, 6))
        let rightEye = SKSpriteNode(color: eyeColor, size: CGSizeMake(6, 6))
        let pupil = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(3,3))
        pupil.position  = CGPointMake(2,0)
        
        leftEye.addChild(pupil)
        rightEye.addChild(pupil.copy() as! SKSpriteNode)
        
        leftEye.position = CGPointMake(-4, 0)
        rightEye.position = CGPointMake(14,0)
        
        face.addChild(leftEye)
        face.addChild(rightEye)
        
        let eyeBrow = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(11,1))
        eyeBrow.position = CGPointMake(-1, leftEye.size.height/2)
        
        leftEye.addChild(eyeBrow)
        rightEye.addChild(eyeBrow.copy() as! SKSpriteNode)
        
        let armColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1.0)
        arms = SKSpriteNode(color: armColor, size: CGSizeMake(8, 14))
        arms.anchorPoint = CGPointMake(0.5,0.9)
        arms.position = CGPointMake(-10, -7)
        body.addChild(arms)
        
        let hand = SKSpriteNode(color: skinColor, size: CGSizeMake(arms.size.width, 5))
        hand.position = CGPointMake(0, -arms.size.height*0.9 +  hand.size.height/2)
        arms.addChild(hand)
        
        leftLeg = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(9, 4))
        leftLeg.position = CGPointMake(-6, -size.height/2 + leftLeg.size.height/2)
        rightLeg = leftLeg.copy() as! SKSpriteNode
        rightLeg.position.x = 8
        
        addChild(leftLeg)
        addChild(rightLeg)
    
    }
    
    
    func startRunning() {
    
        let armMove = SKAction.rotateByAngle(-CGFloat(M_PI)/2.0, duration: 1)
        arms.runAction(armMove)
        performOneRunCycle()
    
    }
    
    func performOneRunCycle() {
    let up = SKAction.moveByX(0, y: 2, duration: 0.05)
    let down = SKAction.moveByX(0, y: -2, duration: 0.05)
        
        leftLeg.runAction(up) { () -> Void in
            self.leftLeg.runAction(down)
            self.rightLeg.runAction(up, completion: { () -> Void in
                self.rightLeg.runAction(down)
                self.performOneRunCycle()
            })
        
        }
    
    }
    
    
    func physicsBodywithSize(size: CGSize){
        
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody!.categoryBitMask = heroPhy
        physicsBody!.contactTestBitMask = wallPhy
          physicsBody!.affectedByGravity = false
    }
    
    
    
    func flip(){
    
        isUpSideDown = !isUpSideDown
        
        let scale: CGFloat!
        
        if isUpSideDown{
        scale = -1.0
        
        }
        else{
        scale = 1.0
        }
        
        let translate = SKAction.moveByX(0, y: scale*(size.height + kmlGroundHeight ), duration: 0.1)
        let flip = SKAction.scaleYTo(scale, duration: 0.1)
        runAction(translate)
        runAction(flip)
    }
    
    
    func fall(){
    
        physicsBody!.affectedByGravity = true
        physicsBody!.applyImpulse(CGVectorMake(-5, 38))
        
        let action = SKAction.rotateByAngle(CGFloat(M_PI) / 2 , duration: 0.4)
        runAction(action)
    }
    
    
    
    func breathe() {
        
        let breathOut = SKAction.moveByX(0, y: -2, duration: 1)
        let breathIn = SKAction.moveByX(0, y: 2, duration: 1)
        
        let breath = SKAction.sequence([breathOut,breathIn])
        body.runAction(SKAction.repeatActionForever(breath))
        
    }
 
    
    
    func stop() {
        body.removeAllActions()
        leftLeg.removeAllActions()
        rightLeg.removeAllActions()
        
    
    }
    
    
    
    
    
    
    
    
    

}