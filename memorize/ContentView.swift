//
//  ContentView.swift
//  memorize
//
//  Created by yux on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var viewModel : EmojiMemoryGame
    
    var body: some View {
        VStack{
            Text("Score: \(viewModel.score)")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                
                cardList
                .animation(.default, value: viewModel.cards)
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .font(.largeTitle)
        }
        .padding()
        .foregroundStyle(.blue)
    }
    
    var cardList: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0){
                ForEach(viewModel.cards) { card in
                    CardView(card : card, color: viewModel.themeColor)
                        .aspectRatio(2/3 , contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
}

struct CardView : View{
    var card : MemoryGame<String>.Card
    var color: Color
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            Group{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                
                Text(card.content)
                    .font(Font.system(size: 300))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1 , contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            shape.fill(color)
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isMatched && !card.isFaceUp ? 0 : 1)
    }
}

#Preview {
    ContentView(viewModel: EmojiMemoryGame())
}
