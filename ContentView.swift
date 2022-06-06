import SwiftUI
import SpriteKit
import GameplayKit

struct ContentView: View {
    var body: some View {
           NavigationView {
                ScrollView {
                VStack {
                    NavigationLink(destination: introddakji()) {
                            Image("ddakjilearn")
                    }
                    NavigationLink(destination: instructions()) {
                        Image("ddakjicreate")
                    }
                    NavigationLink(destination: game()) {
                        Image("ddakjiplay")
                    }
                }
            .navigationTitle("Ddakji")
            }
           }.accentColor(Color(.label))
    }
}
                        
struct game: View {
   let scene = GameScene(size:CGSize(width:400,height:700))

    var body: some View {
        VStack{
            Text("click the screen to start, flick to throw your ddakji")
            SpriteView(scene: scene)
               .frame(width: 400, height: 650)
        }
    }
    }


struct instructions: View {
    var body: some View {
            VStack{
                Image("step1")
                Text("Get 2 square pieces of paper and fold them each into thirds")
                NavigationLink(destination: instructions2()) {
                    Text("next step")
                        .bold()
                        .frame(width:150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.navigationTitle("Step 1")
    }
}

struct instructions2: View {
    var body: some View {
            VStack{
                Image("step2")
                Text("Fold up all the sides into one third and fold in the corners of each piece of paper into right triangles. The folds should be parallel to each other and the resulting shape should be a parallelogram.")
                NavigationLink(destination: instructions3()) {
                    Text("next step")
                        .bold()
                        .frame(width:150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.navigationTitle("Step 2")
    }
}

struct instructions3: View {
    var body: some View {
            VStack{
                Image("step3")
                Text("Lay the folded papers on top of each other (make sure that the angles formed from the edges of the papers are all the same size/ obtuse. If you see a right angle or a straight line formed with the edges then it will not fold right!)")
                NavigationLink(destination: instructions4()) {
                    Text("next step")
                        .bold()
                        .frame(width:150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.navigationTitle("Step 3")
    }
}

struct instructions4: View {
    var body: some View {
            VStack{
                Image("step4")
                Text("Take the top triangular flap and fold it downward.")
                NavigationLink(destination: instructions5()) {
                    Text("next step")
                        .bold()
                        .frame(width:150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.navigationTitle("Step 4")
    }
}

struct instructions5: View {
    var body: some View {
            VStack{
                Image("step5")
                Text("Take the left triangular flap and fold it to the right.")
                NavigationLink(destination: instructions6()) {
                    Text("next step")
                        .bold()
                        .frame(width:150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.navigationTitle("Step 5")
    }
}

struct instructions6: View {
    var body: some View {
            VStack{
                Image("step6")
                Text("Take the bottom triangular flap and fold it upwards")
                NavigationLink(destination: instructions7()) {
                    Text("next step")
                        .bold()
                        .frame(width:150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.navigationTitle("Step 6")
    }
}

struct instructions7: View {
    var body: some View {
            VStack{
                    Image("step7")
                Text("Take the right triangular flap and fold it to the left. Make sure to slide the tip of the right flap underneath the top flap to create the checkered-like design. The result is your very own ddakji! Have fun playing!")
            }.navigationTitle("Step 7")
    }
}

class GameScene: SKScene {
    let dj1 = SKSpriteNode(imageNamed:"dj1")
    let dj2 = SKSpriteNode(imageNamed:"dj2")
    let hand = SKSpriteNode(imageNamed:"hand")
    let youwin = SKSpriteNode(imageNamed:"youwin")
    
     
    override func didMove(to view: SKView) {

    }
    
    
    func touchDown(atPoint pos : CGPoint) {


    }
    
    func touchMoved(toPoint pos : CGPoint) {
        self.removeChildren(in: [dj1])
        let xPos = dj1.position.x
            
        let moveUp = SKAction.move(to: CGPoint(x:xPos, y:self.frame.midY + 300), duration: 1)
            self.addChild(dj1)
            dj1.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 300)
            dj1.yScale = 0.075
            dj1.xScale = 0.075
            dj1.zPosition = -2
            dj1.run(moveUp)

    }
    
    func touchUp(atPoint pos : CGPoint) {


    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let moveLeft = SKAction.move(to: CGPoint(x:self.frame.midX - 160, y:self.frame.midY - 300), duration: 1)
        let moveRight = SKAction.move(to: CGPoint(x:self.frame.midX + 160, y:self.frame.midY - 300), duration: 1)
        // Initialize if not already initialized
        if(!self.contains(dj1)){
            
            self.addChild(dj2)
            dj2.position = CGPoint(x:self.frame.midX, y:self.frame.midY + 300)
            dj2.yScale = 0.075
            dj2.xScale = 0.075
            dj2.zPosition = -2
            
            
            
            self.addChild(dj1)
            dj1.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 300)
            dj1.yScale = 0.075
            dj1.xScale = 0.075
            dj1.zPosition = -2
            dj1.run(SKAction.repeatForever(SKAction.sequence([moveLeft, moveRight])))
            
            if(self.contains(youwin)){
                self.removeChildren(in: [youwin])
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        

        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
      
        if(!self.contains(hand)){
            
            self.addChild(hand)
            hand.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 300)
            hand.yScale = 0.075
            hand.xScale = 0.075
            hand.zPosition = 1
        }
        
        if(self.contains(dj1)){
            if((self.dj1.position.y == self.dj2.position.y) &&
                abs(self.dj1.position.x - self.dj2.position.x) <= 40){
            self.removeChildren(in: [dj1, dj2])
            
            self.addChild(youwin)
            youwin.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            youwin.yScale = 0.075
            youwin.xScale = 0.075
            youwin.zPosition = -2
            }
        }
    }
}
