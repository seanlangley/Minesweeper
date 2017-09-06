//
//  ViewController.swift
//  minesweeper
//
//  Created by Sean Langley on 9/4/17.
//  Copyright © 2017 Sean Langley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var minesLabel: UILabel!
    @IBOutlet weak var minesLeft: UILabel!
    
    let BOARD_SIZE:Int = 10
    var NUM_MINES:Int = 10
    var MINES_LEFT:Int!
    var NEW_NUM_MINES:Int!
    
    var buttons_left:Int = 100
    
    @IBAction func setMinesLabel(sender: UISlider)
    {
        let value = Int(sender.value)
        minesLabel.text = "Number of Mines: \(value)"
        NEW_NUM_MINES = value
    }
    @IBAction func setMinesLeft(sender: UILabel)
    {
        if(MINES_LEFT != nil)
        {
            minesLeft.text = "Mines left: \(MINES_LEFT)"
        }
    }
    
    @IBAction func newGame()
    {
        self.startNewGame()
    
    }
    /*************************/
    /**********STUFF**********/
    /*************************/
    var board:Board
    
    var squareButtons:[SquareButton] = []
    
    func initializeBoard()
    {
        for row in 0 ..< BOARD_SIZE 
        {
            for col in 0 ..< BOARD_SIZE
            {
                
                let square = board.squares[row][col]
                
                let squareSize:CGFloat = self.boardView.frame.width / CGFloat(BOARD_SIZE+1)
                let squareButton = SquareButton(squareModel: square, squareSize: squareSize, squareMargin: CGFloat(3))
                
                squareButton.setTitleColor(UIColor.darkGray, for: .normal)
                
                squareButton.addTarget(self, action:#selector(squareButtonPressed), for: .touchUpInside)
                
                self.boardView.addSubview(squareButton)
                
                self.squareButtons.append(squareButton)
            }
        }
        
        
    }
    
    
    func squareButtonPressed(sender: SquareButton)
    {
        
        if sender.square.isMineLocation
        {
            sender.setTitle("M", for: .normal)
            self.minePressed()
        }
            
        else if sender.square.numNeighboringMines > 0
        {
            let x:String = String(sender.square.numNeighboringMines)
            sender.setTitle(x, for: .normal)
        }
        
       
        else if(sender.square.numNeighboringMines == 0)
        {
            sender.setTitle("", for: .normal)
        }
        if(sender.wasPressed == false)
        {
            buttons_left -= 1
            sender.wasPressed = true
        }
        print("buttons_left = \(buttons_left)")
        if(buttons_left == 0)
        {
            win_sequence()
        }
        
        
    }
    
    func win_sequence()
    {
        let alertView = UIAlertController(title: "YOU WIN!", message: "", preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "New Game", style: .cancel, handler: {_ in self.resetBoard()}))
        present(alertView, animated: true)
        
    }
    
    func minePressed()
    {
        // show an alert when you tap on a mine
        let alertView = UIAlertController(title: "BOOM!", message: "You tapped on a mine", preferredStyle: .alert)

        alertView.addAction(UIAlertAction(title: "New Game", style: .cancel, handler: {_ in self.resetBoard()}))

        present(alertView, animated: true)
        
    }
    
    
    
    func resetBoard() {
        // resets the board with new mine locations & sets isRevealed to false for each square
        buttons_left = board.size * board.size - NUM_MINES
        
        if(NEW_NUM_MINES != nil)
        {
            NUM_MINES = NEW_NUM_MINES
            MINES_LEFT = NUM_MINES
        }
        else
        {
            NUM_MINES = 10
            MINES_LEFT = 10
        }
        
        self.board.resetBoard(numMines: NUM_MINES)
        // iterates through each button and resets the text to the default value
    
        for squareButton in self.squareButtons
        {
            
            squareButton.setTitle("[x]", for: .normal)
            squareButton.wasPressed = false
            /*******TESTING*********/
//            if(squareButton.square.isMineLocation)
//            {
//                squareButton.setTitle("M", for: .normal)
//            }
//            else
//            {
//                squareButton.setTitle("\(String(squareButton.square.numNeighboringMines))", for: .normal)
//            }
            
        }
        

        
    }
    
    required init(coder aDecoder: NSCoder)
    {
        self.board = Board(Size: BOARD_SIZE, numMines: NUM_MINES)
        
        super.init(coder: aDecoder)!
    }
    
    func startNewGame() {
        //start new game
        self.resetBoard()
    }
    
    /**************************/
    /**************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeBoard()
        self.startNewGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

