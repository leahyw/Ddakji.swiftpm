import SwiftUI

struct introddakji: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    Image("playingwddakji")
                    Text("Ddakji is a South Korean game played by two or more people. The game is traditionally played with folded paper squares. The objective is to flip over the other players’ square by throwing your square against it on the ground. Ddakji squares can be created by folding two square pieces of paper together into a square, check out the create button on the main page to learn how to make one for yourself!")
                }
            }
        }.navigationTitle("What is Ddakji?")
    }
}
