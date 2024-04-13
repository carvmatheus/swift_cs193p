//
//  MemorizeGame.swift
//  Memorize
//
//  Created by matheus cardoso on 12/04/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻", "🎃", "🦇", "🧛", "⚰️", "🪄", "🔮", "🧿", "🦄", "🍭", "🧙", "🧌"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex){
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }

    @Published private var model = createMemoryGame()

    @Published var isGameOver = false  // Novo estado para controlar se o jogo acabou

    var cards: Array<Card> {
        model.cards
    }

    var score: Int {
        model.score
    }

    var color: Color {
        .orange
    }

    // MARK: - Intents

    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: Card) {
        model.choose(card)
        checkForGameOver()  // Verifica se o jogo acabou após cada jogada
    }

    func checkForGameOver() {  // Nova função para verificar se o jogo acabou
        if cards.allSatisfy({ $0.isMatched }) {
            isGameOver = true
        }
    }

    func resetGame() {  // Função para resetar o jogo
        model = EmojiMemoryGame.createMemoryGame()
        isGameOver = false
    }
}


