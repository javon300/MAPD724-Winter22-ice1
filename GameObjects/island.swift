import GameplayKit
import SpriteKit

class Island: GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    //life cycle functions()
    override func CheckBounds()
    {
        //if position is off screen reset island
        if (position.y <= -730)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 730
        
        //get psuedo random number between 313 and -313
        let randomX:Int = (randomSource?.nextInt(upperBound: 616))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
    }
    
    //initialization
    override func Start()
    {
        Reset()
        zPosition = 1
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
    }
    
}
