//
//  ContentView.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = Game.getInstance()
    
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                LazyVGrid(columns: gridItemLayout, spacing: 50) {
                    ForEach(0..<9) { index in
                        ZStack {
                            SpaceView(index: index)
                        }
                    }
                }
                
                GameTextView(content: game.result, size: 30)
                    .frame(width: 100, height: 100, alignment: .center)
            }
            .navigationBarTitle(Text("Tic Tac Toe"))
            .navigationBarItems(trailing: Button(action: {                
                game.initGame()
            }, label: {
                GameTextView(content: "New Game!", size: 20)
            }))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
