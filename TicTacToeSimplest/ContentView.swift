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
        NavigationView {
            VStack {
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
                            
                            Spacer()
                        }
                        .onTapGesture {
                            game.playAt(position: index)
                        }
                    }
                }
                
                Text(game.result)
                    .font(.custom("gooddog", size: 30))
            }
            .navigationBarTitle(Text("Tic Tac Toe"))
            .navigationBarItems(trailing: Button(action: {                
                game.initGame()
            }, label: {
                Text("New Game!")
                    .font(.custom("gooddog", size: 20))
            }))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
