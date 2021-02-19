//
//  GameTextView.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 18/02/21.
//

import SwiftUI

struct GameTextView: View {
    let content: String
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Text(content)
            .font(.custom("gooddog", size: size))
            .frame(alignment: .center)
            .foregroundColor(color)
    }
}

struct GameTextView_Previews: PreviewProvider {
    static var previews: some View {
        GameTextView(content: "God is awesome", size: 10, color: .black)
    }
}
