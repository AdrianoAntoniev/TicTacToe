//
//  ContentView.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = Game()
    
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 50) {
            ForEach(0..<9) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    
                    Text(game.grid[index])
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .onTapGesture {
                    game.playAt(position: index)
                }
            }
        }        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
