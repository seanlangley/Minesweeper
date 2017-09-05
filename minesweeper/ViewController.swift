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
    @IBOutlet weak var moveslabel: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    
    
    @IBAction func newGame()
    {
        print("new game");
    
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

