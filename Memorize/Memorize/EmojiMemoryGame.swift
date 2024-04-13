//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by matheus cardoso on 12/04/24.
// Reference to generic type 'ObservedObject' requires arguments in <...>

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🥶", "🤡", "💩", "😈", "🎃", "👽", "🤖", "👾"]
    
    private static func createMemoryGame () -> MemoryGame<String> {
        return MemoryGame(numberOfPairOfCards: 8) {pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
   @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent
    
    func shuffle () {
        model.shuffle()
        print(cards)
    }
    
    func choose (_ card:MemoryGame<String>.Card) {
        model.choose(card)
    }
}
