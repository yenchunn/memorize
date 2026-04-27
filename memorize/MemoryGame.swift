//
//  MemoryGame.swift
//  memorize
//
//  Created by yux on 2026/3/30.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: [Card]
    var score: Int = 0
    
    init(numberOfPairsOfCards: Int,
         createCardContent: (Int) -> CardContent) {
        
        cards = []
        
        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            cards.append(Card(content: content, id: "\(index)a"))
            cards.append(Card(content: content, id: "\(index)b"))
        }
        
        shuffle()
    }
    
  
    var lastFaceUpIndex: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of: card) {
            
       
            if cards[chosenIndex].isFaceUp || cards[chosenIndex].isMatched {
                return
            }
            
            if let lastIndex = lastFaceUpIndex {
                
             
                if cards[lastIndex].content == cards[chosenIndex].content {
                    
                    
                    cards[lastIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score += 2
                    
                } else {
                    
                    if cards[lastIndex].hasBeenSeen {
                        score -= 1
                    }
                    if cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                }
                
       
                cards[lastIndex].hasBeenSeen = true
                cards[chosenIndex].hasBeenSeen = true
                
                lastFaceUpIndex = nil
                
            } else {
                
             
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                
                lastFaceUpIndex = chosenIndex
            }
            
          
            cards[chosenIndex].isFaceUp = true
        }
        
        print("cards: \(cards)")
        print("score: \(score)")
    }
    
    func index(of card: Card) -> Int? {
        for i in cards.indices {
            if cards[i].id == card.id {
                return i
            }
        }
        return nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    

    
    struct Card: Equatable, Identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasBeenSeen: Bool = false   
        
        var content: CardContent
        var id: String
    }
}
