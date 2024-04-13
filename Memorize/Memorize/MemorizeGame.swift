//
//  MemorizeGame.swift
//  Memorize
//
//  Created by matheus cardoso on 12/04/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContenFactory: (Int) -> CardContent){
        cards =  []
        // Add number of Pairs
        for pairIndex in 0..<max(2, numberOfPairOfCards) {
            let content = cardContenFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("chose : \(card)")
    }
    
    func index (of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "unmatched")"
        }
        
        var id: String
    }
}
