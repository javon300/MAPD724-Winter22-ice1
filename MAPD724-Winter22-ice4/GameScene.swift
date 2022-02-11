//
//  GameScene.swift
//  MAPD724-Winter22-ice1
//
//  Created by javon maxwell on 2022-01-22.
//

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    //instance variables
    var ocean: Ocean?
    var plane: Plane?
    var island: Island?
    var clouds: [Cloud] = []

    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        
        
        name = "GAME"
        
        //add ocean to screen
        ocean = Ocean()  //alloate memory  for variable
        ocean?.position = CGPoint(x: 0, y: 773)
        addChild(ocean!)
        
        //add plane to the scene
        plane = Plane()
        plane?.position = CGPoint(x: 0, y: -490)
        addChild(plane!)
        
        
        //add island to scene
        island = Island()
        addChild(island!)
        
        //add cloud to screen
        for index in 0...2
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
        //add sound
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        //preloaded sounds
        do
        {
            let sounds:[String] = ["thunder", "engine"]
            for sound in sounds
            {
//                let path = Bundle.main.path(forResource: sound, ofType: "mp3")!
//                let url: URL = URL(fileURLWithPath: path)
//                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
//                     player.prepareToPlay()
            }
            
        }
        catch
        {
            
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -490))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -490))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -490))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
        plane?.Update()
        ocean?.Update()
        island?.Update()
        
        
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: cloud)
        }
        
        //check for collision
        CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: island!)
        
    }
}
