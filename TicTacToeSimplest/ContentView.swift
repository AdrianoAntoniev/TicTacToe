//
//  ContentView.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    private var grid: [String] = []
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 50) {
            ForEach(0..<9) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    
                    Text(Mark.o)
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        
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
