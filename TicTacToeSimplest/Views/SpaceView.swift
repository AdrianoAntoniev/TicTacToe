//
//  SpaceView.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 18/02/21.
//

import SwiftUI

struct SpaceView: View {
    @ObservedObject var game = Game.getInstance()
    @State private var degrees: Double = 0
    
    private let index: Int
    
    init(index: Int) {
        self.index = index
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .shadow(color: .gray, radius: 5)
                .onTapGesture {
                    withAnimation {
                        game.playAt(position: index)
                        degrees += 180                                                
                    }   
                }
            
            Text(game.grid[index])
                .foregroundColor(game.grid[index] == game.getRandomMark() ? .red : .blue)
                .font(.largeTitle)
                .fontWeight(.black)
                .shadow(radius: 5)
        }
        .rotation3DEffect(
            .degrees(degrees),
            axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceView(index: 0)
    }
}
