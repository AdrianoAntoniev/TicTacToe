//
//  Mark.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 18/02/21.
//

import Foundation

class Game: ObservableObject {
    @Published  var grid: [String] = []
    private static let x = "X"
    private static let o = "O"
    private static let blank = ""
    
    private var choices: [Bool: String] = [:]
    private var turn: Bool = Bool.random()
    private var marks: Int = 0
        
    init() {
        initGame()
    }
    
    func initGame() {
        grid = [Self.blank, Self.blank, Self.blank,
                Self.blank, Self.blank, Self.blank,
                Self.blank, Self.blank, Self.blank
        ]
        turn = Bool.random()
        choices = [false: Self.x, true: Self.o]
        marks = 0
    }
    
    func playAt(position: Int) {
        if grid[position] == Self.blank {
            marks += 1
            grid[position] = choices[turn]!
            turn.toggle()                        
        }        
    }
}
