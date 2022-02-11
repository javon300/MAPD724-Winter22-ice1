import SpriteKit
import GameplayKit

class CollisionManager
{
    public static var gameViewController: GameViewController?
    //utility function
    //adds the raious of colliding objects to check if they collided
    public static func SquaredDistance(point1:CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    public static func SquaredRadiusCheck(scene:SKScene, object1:GameObject, object2: GameObject) -> Void
    {
        let p1 = object1.position
        let p2 = object2.position
        let p1Radius = object1.height!
        let p2Radius = object2.height!
        let radii = p1Radius + p2Radius
        
        if(SquaredDistance(point1: p1, point2: p2) < radii * radii)
        {
            //we have a collision
            if (!object2.isColliding!)
            {
                switch (object2.name)
                {
                   case "island":
                       ScoreManager.Score += 100
                       gameViewController?.updateScoreLabel()
                       scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                       break
                   case "cloud":
                       ScoreManager.Lives -= 1
                        gameViewController?.updateLivesLabel()
                       scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                       break
                   default:
                       break
                   }
                object2.isColliding = true
            
            }
        }
        
    }
}
