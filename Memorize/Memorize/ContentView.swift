//
//  ContentView.swift
//  Memorize
//
//  Created by matheus cardoso on 10/04/24.
//

import SwiftUI //Importa a SwiftUI. Nem sempre importa as coisas
// é de costume separar backend de frontend

struct ContentView: View {  // Struct => é qualquer coisa
    // ContentView => é o nome desse elemento
    // View => ContentView se comporta como um View. Que somente é um retangulo dentro da tela
    var body: some View {   // Se é uma View, tem que ter esse elemento.
        // Some View: basicamente é, executa isso, ve o que retorna. Deve ser algo parecido
        // com uma View
        
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}
    
struct CardView: View{
    var isFaceUp: Bool = false // Default Value
    
    
    var body: some View{
        ZStack {            // Vertical Stack
            //Image(systemName: "globe") // Struct - Temos 2 views dentro
            
            //Text("Olá Matheus!").padding()       // Struct - 2a view dentro de Vstack
            
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}





























#Preview {
    ContentView()
}
