//
//  ContentView.swift
//  memorize
//
//  Created by 11344245 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    var body: some View{
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                    .foregroundStyle(.orange)
            Text("✈️")
            }
                
        }
    }
}
#Preview {
    ContentView()
}
