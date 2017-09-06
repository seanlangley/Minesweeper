//
//  SquareButton.swift
//  minesweeper
//
//  Created by Sean Langley on 9/4/17.
//  Copyright © 2017 Sean Langley. All rights reserved.
//

import Foundation

import UIKit
class SquareButton : UIButton {
    let squareSize:CGFloat
    let squareMargin:CGFloat
    var square:Square
    var wasPressed = false
    
    init(squareModel:Square, squareSize:CGFloat, squareMargin:CGFloat) {
        self.square = squareModel
        self.squareSize = squareSize
        self.squareMargin = squareMargin
        let x1 = CGFloat(self.square.col) * (squareSize + squareMargin)
        let y1 = CGFloat(self.square.row) * (squareSize + squareMargin)
        let squareFrame  = CGRect(origin: CGPoint(x: x1, y: y1), size: CGSize(width: squareSize, height: squareSize))
        super.init(frame: squareFrame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
