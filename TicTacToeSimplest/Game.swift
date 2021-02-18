//
//  Mark.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 18/02/21.
//

import Foundation

class Game: ObservableObject {
    @Published var grid: [String] = []
    
    private static let x = "X"
    private static let o = "O"
    private static let blank = ""
    
    private let firstRow: IndexSet =      [0,1,2]
    private let secondRow: IndexSet =     [3,4,5]
    private let thirdRow: IndexSet =      [6,7,8]
    private let firstCol: IndexSet =      [0,3,6]
    private let secondCol: IndexSet =     [1,4,7]
    private let thirdCol: IndexSet =      [2,5,8]
    private let diagonalLeft: IndexSet =  [0,4,8]
    private let diagonalRight: IndexSet = [2,4,6]
    
    private var choices: [Bool: String] = [:]
    private var turn: Bool = Bool.random()
    private var marks: Int = 0
        
    init() {
        initGame()
    }
    
    func initGame() {
        grid = [Self.blank, Self.blank, Self.blank,
                Self.blank, Self.blank, Self.blank,
                Self.blank, Self.blank, Self.blank]
        turn = Bool.random()
        choices = [false: Self.x, true: Self.o]
        marks = 0
    }
    
    func playAt(position: Int) {
        if grid[position] == Self.blank {
            marks += 1
            grid[position] = choices[turn]!
            
            if isVictoryOf(mark: choices[turn]!) {
                print("\(choices[turn]!) ganhou!")
            } else {
                turn.toggle()
            }
        }        
    }
    
    private func isVictoryOf(mark: String) -> Bool {
        return marks >= 5 &&
            verifyIf(mark: mark, isIn: firstRow) ||
            verifyIf(mark: mark, isIn: secondRow) ||
            verifyIf(mark: mark, isIn: thirdRow) ||
            verifyIf(mark: mark, isIn: firstCol) ||
            verifyIf(mark: mark, isIn: secondCol) ||
            verifyIf(mark: mark, isIn: thirdCol) ||
            verifyIf(mark: mark, isIn: diagonalLeft) ||
            verifyIf(mark: mark, isIn: diagonalRight)
        
    }
    
    private func verifyIf(mark: String, isIn array: IndexSet) -> Bool {
        return array.map { grid[$0] }.allSatisfy { $0 == mark }
    }
}
