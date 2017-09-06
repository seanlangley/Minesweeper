//
//  Board.swift
//  minesweeper
//
//  Created by Sean Langley on 9/4/17.
//  Copyright © 2017 Sean Langley. All rights reserved.
//

import Foundation


class Board{
    
    var size:Int = 10
    var squares: [[Square]] = []
    var NUM_MINES: Int
    
    
    init(Size: Int, numMines: Int)
    {
        size = Size
        NUM_MINES = numMines
        
        for row in  0 ..< size
        {
            var squareRow : [Square] = []
            for col in 0 ..< size
            {
                let square: Square = Square(row: row, col: col)
                squareRow.append(square)
            }
            squares.append(squareRow)
        }
        
       
    }
    
    func countNeighboringMines(square: Square)
    {
        
            let offsets = [(1,1), (1,0), (1,-1), (0,1), (0,-1), (-1,1), (-1,0), (-1,-1)]
            
            for (row, col) in offsets
            {
                let row0 = square.row + row
                let col0 = square.col + col
                for squareRow in squares
                {
                    for square0 in squareRow
                    {
                        if(square0.isMineLocation && square0.row == row0 && square0.col == col0)
                        {
                           
                            square.numNeighboringMines += 1
                        }
                    }
                }
            }
        
            
        
    }
    
    
    func set_mines_false()
    {
        for row in 0 ..< size
        {
            for col in 0 ..< size
            {
                squares[row][col].isMineLocation = false
            }
        }
    }
    
    func assign_mines()
    {
        set_mines_false()
        
        for row in 0 ..< size
        {
            for col in 0 ..< size
            {
                squares[row][col].numNeighboringMines = 0
            }
        }
        
        let area = size * size
        var mine_count:Int = 0
        for _ in 0 ..< area
        {
            if(mine_count >= NUM_MINES)
            {
                break;
            }
            let row: Int = Int(arc4random())  % size
            let col: Int = Int(arc4random()) % size
            
           
            
            if( squares[row][col].isMineLocation == false)
            {
            
                squares[row][col].isMineLocation = true
                mine_count += 1
                
            }
            
        }
    }

    
    func resetBoard(numMines: Int)
    {
        NUM_MINES = numMines
        for row in 0 ..< size
        {
            for col in 0 ..< size
            {
                squares[row][col].isRevealed = false
            }
        }
       
        self.assign_mines()
        
        
        
        for squareRow in squares
        {
            for square in squareRow
            {
                if !square.isMineLocation
                {
                    countNeighboringMines(square: square)
                }
            }
        }
        
    }
}






















