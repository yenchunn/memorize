//
//  memorizeApp.swift
//  memorize
//
//  Created by yux on 2026/3/16.
//

import SwiftUI

@main
struct memorizeApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
            
        }
    }
}


struct ThemePool<T> {
    
    private(set) var themes: [Theme] = []
    
    mutating func addTheme(_ theme: Theme) {
        themes.append(theme)
    }
    
    struct Theme {
        var name: String
        var color: Color
        var numberOfPairs: Int
        var items: [T]
    }
}
