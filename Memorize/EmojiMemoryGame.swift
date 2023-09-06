//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Дениc on 07.09.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "👻", "😈", "👻", "🎃", "👻", "😈", "👻", "🎃", "👻", "😈", "👻", "🎃", "👻", "😈"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "💰"
            }
            
        }
    }
    
    @Published private var model = createMemoryGame()
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
