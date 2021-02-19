//
//  PriquitoView.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 18/02/21.
//

import SwiftUI

struct TestButtonFlipView: View {
    @State var rotation: Double = 0
    
    var body: some View {
        VStack {
            Button("Mia Khalifa") {
                withAnimation {
                    rotation += 360
                }
                
            }

            Image(systemName: "sun.max")
                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        }.font(.title)
    }
}

struct TestButtonFlipView_Previews: PreviewProvider {
    static var previews: some View {
        TestButtonFlipView()
    }
}
