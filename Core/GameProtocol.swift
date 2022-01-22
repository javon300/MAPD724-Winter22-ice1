protocol GameProtocol
{
    //prevent an object from leaving the screen or detect that it has done so
    func CheckBounds()
    
    //Rset our game object offScreen
    func Reset()
    
    //initialize properties for our ga=me object
    func Start()
    
    //update will be called every frame (60 times per second) = 16.666ms
    func Updaate()
}
