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
    var cloud: Cloud?

    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        
        
        name = "Plane Game"
        
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
        cloud = Cloud()
        addChild(cloud!)
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
        ocean?.Update()
        island?.Update()
        plane?.Update()
        cloud?.Update()
        
    }
}
