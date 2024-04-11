//
//  ContentView.swift
//  Memorize
//
//  Created by matheus cardoso on 10/04/24.
//

import SwiftUI

struct ContentView: View {  // Struct => é qualquer coisa
    let emojis: Array<String> = ["👻", "🥶", "🤡", "💩", "😈"]
    
    var body: some View {   // Se é uma View, tem que ter esse elemento.
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}
    
struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true // @State está criando um apontador
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture{
            isFaceUp.toggle()
        }
    }
}





























#Preview {
    ContentView()
}
