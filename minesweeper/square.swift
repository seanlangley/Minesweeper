//
//  square.swift
//  minesweeper
//
//  Created by Sean Langley on 9/4/17.
//  Copyright © 2017 Sean Langley. All rights reserved.
//

import Foundation

class Square{
    
    let row:Int
    let col:Int
    var numNeighboringMines = 0
    var isMineLocation = false
    var isRevealed = false
    
    init(row:Int, col:Int)
    {
        self.row = row
        self.col = col
    }
}
