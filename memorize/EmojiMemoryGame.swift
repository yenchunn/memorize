//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by yux on 2026/3/30.
//

import Foundation
import SwiftUI
@Observable
class EmojiMemoryGame {
    typealias Theme = ThemePool<String>.Theme
        
    
        private var model: MemoryGame<String>
        
        
        private var themePool: ThemePool<String>
        
     
        private var theme: Theme
        
  
        init() {
            let pool = EmojiMemoryGame.createThemePool()
                
            let selectedTheme = pool.themes.randomElement()!
                
            self.themePool = pool
            self.theme = selectedTheme
            self.model = EmojiMemoryGame.createMemoryGame(with: selectedTheme)
        }
   
        private static func createThemePool() -> ThemePool<String> {
            var pool = ThemePool<String>()
            
            pool.addTheme(.init(
                name: "Fruits",
                color: .red,
                numberOfPairs: 6,
                items: ["🍎","🍌","🍇","🍉","🍓","🥝"]
            ))
            
            pool.addTheme(.init(
                name: "Animals",
                color: .green,
                numberOfPairs: 6,
                items: ["🐶","🐱","🐭","🐰","🦊","🐻"]
            ))
            
            pool.addTheme(.init(
                name: "Sports",
                color: .blue,
                numberOfPairs: 6,
                items: ["⚽️","🏀","🏈","⚾️","🎾","🏐"]
            ))
            
            return pool
        }
        
        // MARK: - 建立遊戲
        private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
            
            let shuffledItems = Array(theme.items.shuffled().prefix(theme.numberOfPairs))
            
            return MemoryGame<String>(
                numberOfPairsOfCards: theme.numberOfPairs
            ) { index in
                shuffledItems[index]
            }
        }
        
        // MARK: - Intent
        func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
        }
        
        func shuffle() {
            model.shuffle()
        }
        
    
        func newGame() {
            theme = themePool.themes.randomElement()!
            model = EmojiMemoryGame.createMemoryGame(with: theme)
        }
        

        var cards: [MemoryGame<String>.Card] {
            model.cards
        }
        
        var score: Int {
            model.score
        }
        
        var themeName: String {
            theme.name
        }
        
        var themeColor: Color {
            theme.color
        }
    }


