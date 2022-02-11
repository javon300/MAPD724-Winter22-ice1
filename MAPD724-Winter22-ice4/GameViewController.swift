//
//  GameViewController.swift
//  MAPD724-Winter22-ice1
//
//  Created by javon maxwell on 2022-01-22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
           // view.showsFPS = true
            //view.showsNodeCount = true
        }
        CollisionManager.gameViewController = self
        //initialize lives and score
        ScoreManager.Score = 00
        ScoreManager.Lives = 5
        updateScoreLabel()
        updateLivesLabel()
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
    
}
