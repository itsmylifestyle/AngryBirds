//
//  GameScene.swift
//  AngeryBirds
//
//  Created by Айбек on 27.09.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //var bird2 = SKSpriteNode()
    
    var bird = SKSpriteNode()
    var elbasy = SKSpriteNode()
    
    var box1 = SKSpriteNode()
    let box1texture = SKTexture(imageNamed: "box1")
    var box2 = SKSpriteNode()
    let box2texture = SKTexture(imageNamed: "box2")
    var box3 = SKSpriteNode()
    let box3texture = SKTexture(imageNamed: "box3")
    var box4 = SKSpriteNode()
    let box4texture = SKTexture(imageNamed: "box4")
    var box5 = SKSpriteNode()
    let box5texture = SKTexture(imageNamed: "box5")
    var box6 = SKSpriteNode()
    let box6texture = SKTexture(imageNamed: "box6")
    var box7 = SKSpriteNode()
    let box7texture = SKTexture(imageNamed: "box7")
    var box8 = SKSpriteNode()
    let box8texture = SKTexture(imageNamed: "box8")
    var box9 = SKSpriteNode()
    let box9texture = SKTexture(imageNamed: "box9")
    
    
    var gameStarted = false
    var score = 0
    var scoreLabel = SKLabelNode()
    var originalPo : CGPoint?
    
    enum ColliderTypes: UInt32 {
        case Bird = 1
        case Elbasy = 2
    }
    
    override func didMove(to view: SKView) {
        
        /*let texture = SKTexture(imageNamed: "pres")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: 0, y: 0)
        bird2.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 6)
        bird2.zPosition = 3
        self.addChild(bird2)
         */
        //Scene physics
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame.offsetBy(dx: 0, dy: 100))
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        //Bird Physics
        bird = childNode(withName: "pres") as! SKSpriteNode
        let texture = SKTexture(imageNamed: "pres")
        bird.physicsBody = SKPhysicsBody(texture: texture, size: bird.size)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.25
        originalPo = bird.position
        bird.physicsBody?.contactTestBitMask = ColliderTypes.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderTypes.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderTypes.Elbasy.rawValue
        
        //elbasy
        elbasy = childNode(withName: "elbasy") as! SKSpriteNode
        let eltext = SKTexture(imageNamed: "elbasy")
        elbasy.physicsBody = SKPhysicsBody(texture: eltext, size: elbasy.size)
        elbasy.physicsBody?.affectedByGravity = true
        elbasy.physicsBody?.isDynamic = true
        elbasy.physicsBody?.allowsRotation = true
        elbasy.physicsBody?.mass = 0.4
        elbasy.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        //Boxes physics
        
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        let textureSize = CGSize(width: box1texture.size().width, height: box1texture.size().height)
        let smallerSize = CGSize(width: textureSize.width - 30, height: textureSize.height - 30)
        box1.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 1
        //box1.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 1
        //box2.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        //box3.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
       // box4.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
       // box5.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.mass = 0.4
        //box6.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box7 = childNode(withName: "box7") as! SKSpriteNode
        box7.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box7.physicsBody?.isDynamic = true
        box7.physicsBody?.affectedByGravity = true
        box7.physicsBody?.allowsRotation = true
        box7.physicsBody?.mass = 0.4
       // box7.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box8 = childNode(withName: "box8") as! SKSpriteNode
        box8.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box8.physicsBody?.isDynamic = true
        box8.physicsBody?.affectedByGravity = true
        box8.physicsBody?.allowsRotation = true
        box8.physicsBody?.mass = 0.4
      //  box8.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box9 = childNode(withName: "box9") as! SKSpriteNode
        box9.physicsBody = SKPhysicsBody(rectangleOf: smallerSize)
        box9.physicsBody?.isDynamic = true
        box9.physicsBody?.affectedByGravity = true
        box9.physicsBody?.allowsRotation = true
        box9.physicsBody?.mass = 0.4
        //box9.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        //Label
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.fontColor = .black
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 4
        self.addChild(scoreLabel)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderTypes.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderTypes.Bird.rawValue {
            score += 1
            scoreLabel.text = String(score)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
        
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNode = nodes(at: touchLocation)
                
                if touchNode.isEmpty == false {
                    for node in touchNode {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == node {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNode = nodes(at: touchLocation)
                
                if touchNode.isEmpty == false {
                    for node in touchNode {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == node {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNode = nodes(at: touchLocation)
                
                if touchNode.isEmpty == false {
                    for node in touchNode {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == node {
                                let dx = -(touchLocation.x - originalPo!.x)
                                let dy = -(touchLocation.y - originalPo!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let a = bird.physicsBody {
            if a.velocity.dx <= 0.1 && a.velocity.dy <= 0.1 && a.angularVelocity <= 0.1 && gameStarted == true{
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 3
                bird.position = originalPo!
            
                
                score = 0
                scoreLabel.text = String(score)
                gameStarted = false

                
            }
        }
    }
}
