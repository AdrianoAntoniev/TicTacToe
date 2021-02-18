//
//  Mark.swift
//  TicTacToeSimplest
//
//  Created by Adriano Rodrigues Vieira on 18/02/21.
//

import Foundation
import SwiftUI

class Game: ObservableObject {
    @Published var grid: [String] = []
    @Published var result: String = ""
    
    private static let x = "X"
    private static let o = "O"
    private static let blank = ""
    
    private let firstLine: IndexSet =     [0,1,2]
    private let secondLine: IndexSet =    [3,4,5]
    private let thirdLine: IndexSet =     [6,7,8]
    private let firstCol: IndexSet =      [0,3,6]
    private let secondCol: IndexSet =     [1,4,7]
    private let thirdCol: IndexSet =      [2,5,8]
    private let diagonalLeft: IndexSet =  [0,4,8]
    private let diagonalRight: IndexSet = [2,4,6]
    
    private var choices: [Bool: String] = [:]
    private var turn: Bool = Bool.random()
    private var marksCount: Int = 0
    private var isEndGame = false
        
    init() {        
        initGame()
    }
    
    func initGame() {
        grid = [Self.blank, Self.blank, Self.blank,
                Self.blank, Self.blank, Self.blank,
                Self.blank, Self.blank, Self.blank]
        turn = Bool.random()
        choices = [false: Self.x, true: Self.o]
        marksCount = 0
        isEndGame = false
        result = ""
    }
    
    func playAt(position: Int) {
        if grid[position] == Self.blank && !isEndGame {
            marksCount += 1
            grid[position] = choices[turn]!
            
            isEndGame = marksCount >= 9 || isVictoryOf(mark: choices[turn]!)
            print(isEndGame)
            
            if isEndGame {
                if marksCount >= 9 {
                    result = "Ouch! It is a Draw."
                } else {
                    result = "\(choices[turn]!) is winner!"
                }
            } else {
                turn.toggle()
            }
        }
    }
    
    private func isVictoryOf(mark: String) -> Bool {
        return marksCount >= 5 &&
            isRow(of: mark, in: firstLine) ||
            isRow(of: mark, in: secondLine) ||
            isRow(of: mark, in: thirdLine) ||
            isRow(of: mark, in: firstCol) ||
            isRow(of: mark, in: secondCol) ||
            isRow(of: mark, in: thirdCol) ||
            isRow(of: mark, in: diagonalLeft) ||
            isRow(of: mark, in: diagonalRight)
        
    }
    
    private func isRow(of mark: String, in array: IndexSet) -> Bool {
        return array.map { grid[$0] }.allSatisfy { $0 == mark }
    }
}
