//
//  GameViewController.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/27/16.
//  Copyright (c) 2016 Muhammad Asad. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {

    var scene: GameScene!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure view
        let skview = view as! SKView
        skview.multipleTouchEnabled = false
        
        // Create and Configure view
        scene = GameScene(size: skview.bounds.size)
        scene.scaleMode = .AspectFill
        
        //Present Scene
        skview.presentScene(scene)
        
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    func music(){
        
        var player: AVAudioPlayer = AVAudioPlayer()
        
        let path = NSBundle.mainBundle().pathForResource("theme", ofType: "mp3")!
        
        do{
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path))
                 player.play()
            
        }
        catch{
            // process error
        }

    
    
    
    }
}
