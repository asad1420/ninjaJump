//
//  GameScene.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/27/16.
//  Copyright (c) 2016 Muhammad Asad. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    var test = 0
    var a = 0;
    var forMusic: GameViewController!
    var movingGround: mlMoving!
    var movingHero: mlHero!
    var cloudGenarate: cloudGenerator!
    var wallGen: wallGenerator!
    var isGameOver = false
    var player: AVAudioPlayer = AVAudioPlayer()
    var soundgO: AVAudioPlayer = AVAudioPlayer()
    //var score = 0
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundColor = UIColor(red: 155/255, green: 170/255, blue: 190/255, alpha: 1.0)
        
        movingGround = mlMoving(size: CGSizeMake(view.frame.width, kmlGroundHeight))
        movingGround.position = CGPointMake(0, view.frame.size.height/2)
        addChild(movingGround)
 
        movingHero = mlHero()
        movingHero.position = CGPointMake(70, movingGround.position.y + movingGround.frame.size.height/2 + movingHero.frame.size.height/2)
        addChild(movingHero)
        movingHero.breathe()
        
        // For cloud Generation
        cloudGenarate = cloudGenerator(color: UIColor.clearColor(), size: CGSizeMake(view.frame.width,  view.frame.height))
        cloudGenarate.position = view.center
        addChild(cloudGenarate)
        cloudGenarate.cloudGenerate(7)
        
        cloudGenarate.startGeneratingSpwanTime(5)
        
        // wall generating
        
         wallGen = wallGenerator(color: UIColor.clearColor(),  size: CGSizeMake(view.frame.width,  view.frame.height))
        wallGen.position = view.center
        addChild(wallGen)
        
        //ADD LABEL
        let startlabel = SKLabelNode(text: "Tap to Start")
        startlabel.position.x = view.center.x
        startlabel.position.y = view.center.y + 40
        startlabel.fontSize = 33.0
        startlabel.fontColor = UIColor.blackColor()
        startlabel.name = "tapToStart"
        addChild(startlabel)
        startlabel.runAction(blinkAction())
      
        physicsWorld.contactDelegate = self
        
        scoreLabel()
        
        
    }
    
    func gameOverLabel(){
     
        let endLabel = SKLabelNode(text: "Game Over!!")
        endLabel.position.x = view!.center.x
        endLabel.position.y = view!.center.y + 80
        endLabel.fontSize = 33.0
        endLabel.fontColor = UIColor.blackColor()
        addChild(endLabel)
        endLabel.runAction(blinkAction())
    
    }
    
    
    
    func startFlipping(){
        
        if !isGameOver {
        movingHero.flip()
        }
    
    
    }
    func wallGenn(){
      wallGen.startGeneratingWallInEverySecond(0.5)
    }
    
    func gameOver(){
      isGameOver = true
        collisionSound()
        movingHero.fall()
        wallGen.stopMakingWalls()
        movingGround.stop()
        movingHero.stop()
        gameOverLabel()
        cloudGenarate.cloudStop()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        if isGameOver {
        
            restart()
        }
        
        
        if a==0{
            a++}
       
        else{
        a=a+2
        }
        
        
        if a == 1 {
        
        let lab = childNodeWithName("tapToStart")
        lab?.removeFromParent()
        movingGround.start()
        movingHero.startRunning()
        wallGenn()
        music()
        }
        
        if a>2{
      startFlipping()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        
        test++
        
    
        if wallGen.wallTracker.count > 0 {
        
        let wall = wallGen.wallTracker[0] as! mlWall
        
        let wallLocation = wallGen.convertPoint(wall.position, toNode: self)
          
            if wallLocation.x < movingHero.position.x {
                
                wallGen.wallTracker.removeAtIndex(0)
                
                incScore()
            
            }
        
        
        
        
        }
    }
    
    func incScore(){
    score++
     print(test)
    }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        if !isGameOver{
        gameOver()
        musicStop()
        }
    }
    
    func restart(){
        
    
    let scene = GameScene(size: view!.bounds.size)
        scene.scaleMode = .AspectFill
        view!.presentScene(scene)
    
    
    }
    
    func music(){
        
        
        
        let path = NSBundle.mainBundle().pathForResource("theme", ofType: "mp3")!
        
        do{
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path))
            player.play()
            
        }
        catch{
            // process error
        }
        
        
    }
    
    func musicStop(){
    player.stop()
    
    }
    
    func collisionSound(){
    
        
        let path = NSBundle.mainBundle().pathForResource("gameover", ofType: "mp3")!
        
        do{
            try soundgO = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path))
            soundgO.play()
            
        }
        catch{
            // process error
        }
    
    }
    
    func blinkAction() -> SKAction {
    
        let duration = 0.4
        let fadeOut = SKAction.fadeAlphaTo(0.0, duration:duration)
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: duration)
        
        let blink = SKAction.sequence([fadeOut,fadeIn])
        
        return SKAction.repeatActionForever(blink)
     
    }
    
    func scoreLabel(){
      
        let lab_score = SKLabelNode(text: "Score=\(score)")
        lab_score.position.x = view!.center.x + 250
        lab_score.position.y = view!.center.y + 160
        lab_score.fontSize = 22.0
        lab_score.fontColor = UIColor.blackColor()
        lab_score.fontName = "helvetica"
        addChild(lab_score)
    
    }
    
    
    
}
