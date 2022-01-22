

import GameplayKit
import SpriteKit

class GameObject: SKSpriteNode, GameProtocol
{
    
    
    //public instance members
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    
    var width: CGFloat?
    var height: CGFloat?
    var half_width: CGFloat?
    var half_height: CGFloat?
    
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    //constructor/ initializer
    //super class for various game objects
    init (imageString: String, initialScale: CGFloat)
    {
        //texture is an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        
        super.init(texture: texture, color: color, size: texture.size())
        
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        half_width = width! * 0.5
        half_height = height! * 0.5
        isColliding = false
        
        name = imageString
        randomSource = GKARC4RandomSource()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func CheckBounds()
    {
        
    }
    
    func Reset()
    {
        
    }
    
    func Start()
    {
        
    }
    
    func Update()
    {
        
    }
    
 
}
