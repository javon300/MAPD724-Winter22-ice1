import GameplayKit
import SpriteKit

class Cloud: GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
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
        if (position.y <= -756)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        //get psuedo random number between 262 and -262 for x axis
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        //get psuedo random number between 262 and -262 for y axis
        let randomY:Int = (randomSource?.nextInt(upperBound: 20))! + 756
        position.y = CGFloat(randomY)
        
        //random vertical speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0

        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0

        isColliding = false
    }
    
    //initialization
    override func Start()
    {
        Reset()
        zPosition = 3
        alpha = 0.5 //transparency
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
        position.x -= horizontalSpeed!
    }
    
}
