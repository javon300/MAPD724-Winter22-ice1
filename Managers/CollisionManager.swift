import SpriteKit
import GameplayKit

class CollisionManager
{
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
        
        if (!object2.isColliding!)
        {
            switch (object2.name)
            {
                case "island":
                    print("coliding with island")
                case "cloud":
                    print("coliding with cloud")
                default:
                    break
            }
            object2.isColliding = true
        
        }
    }
}
