//
//  ContentView.swift
//  Memorize
//
//  Created by matheus cardoso on 10/04/24.
//

import SwiftUI

struct ContentView: View {  // Struct => é qualquer coisa
    let emojis: Array<String> = ["👻", "🥶", "🤡", "💩", "😈", "🎃", "👽", "🤖", "👾"]
    
    @State var cardCount: Int = 4
    var body: some View {   // Se é uma View, tem que ter esse elemento.
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardAdjusters
        }
        .padding()
    }
    var cardAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large)
            .font(.largeTitle)
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
            .foregroundColor(.orange)
    }
    func cardModAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View{
        cardModAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardAdder: some View {
        cardModAdjusters(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}
    
struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true // @State está criando um apontador
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0: 1)
            
        }.onTapGesture{
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
