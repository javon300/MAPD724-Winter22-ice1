//
//  GameViewController.swift
//  MAPD724-Winter22-ice1
//
//  Created by javon maxwell on 2022-01-22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
 
    

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    
    //keeps track of current screen displayed
    var currentScene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        livesLabel.isHidden = true
        scoreLabel.isHidden = true
        CollisionManager.gameViewController = self
//        //initialize lives and score
//        ScoreManager.Score = 0
//        ScoreManager.Lives = 5
//        updateScoreLabel()
//        updateLivesLabel()
        
        setScene(sceneName: "GameScene")
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void

    {
        scoreLabel.text = "Score: \(ScoreManager.Score)"

    }
    
    func updateLivesLabel()
    {
        livesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        
        if let view = self.view as! SKView?
        {
            //load the SKSceen and store reference in currentScene
            currentScene = SKScene(fileNamed: sceneName)
            
            // Load the SKScene from 'GameScene.sks'
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            
            }
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
            
        }
    }
    
    func PresentStartSceeen()
    {
        //hides labels that keep track in game
        scoreLabel.isHidden = true
        livesLabel.isHidden = true
    }
    
    func PresentEndSceen()
    {
        //hides labels that keep track in game
        scoreLabel.isHidden = true
        livesLabel.isHidden = true
        setScene(sceneName: "EndSceen")
    }
}
