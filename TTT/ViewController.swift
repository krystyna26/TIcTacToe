//
//  ViewController.swift
//  TTT
//
//  Created by Krystyna Swider on 11/1/17.
//  Copyright © 2017 Krystyna Swider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = [
        [0,0,0],
        [0,0,0],
        [0,0,0],
        ]
    var player = 1
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func resetButton(_ sender: UIButton) {
        game = [
            [0,0,0],
            [0,0,0],
            [0,0,0],
        ]
//        for stack in boxes.subviews OR (boxes is in view controller)
//        for button in stack.subviews
//        button.backgroundColor = .lightGray
        for button in buttons {
            button.backgroundColor = .lightGray
            button.isEnabled = true
        }
        player = 1
        resultLabel.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        
        var tagstr = String(format:"%02d", sender.tag)
        print("tagstr \(tagstr)")
        let x = Int(String(Array(tagstr.characters)[0]))!
        let y = Int(String(Array(tagstr.characters)[1]))!
        print("x and y \(x,y)")
        
        if game[x][y] == 0 {
            game[x][y] = player
            var color:UIColor
            if player == 1 { color = .blue}
            else {color = .red}
            sender.backgroundColor = color
            
            checkWinner()
            
            if player == 1 { player = -1}
            else { player = 1 }
        }
    }
    
    func checkWinner(){
        var winner = 0
        var sum = 0
        
        //          cols
        for col in game {
            sum = col.reduce(0, +)
            if sum == 3 { winner = 1}
            else if sum == -3 { winner = -1}
        }
        //          rows
        for x in 0...2 {
            let a = game[0][x]
            let b = game[1][x]
            let c = game[2][x]
            sum = a + b + c
            print("sum \(sum)")
            if sum == 3 { winner = 1}
            else if sum == -3 { winner = -1}
        }
        
        sum = game[0][0] + game[1][1] + game[2][2]
        if sum == 3 {winner = 1}
        else if sum == -3 {winner = -1}
        
        sum = game[2][0] + game [1][1] + game[0][2]
        if sum == 3 {winner = 1}
        else if sum == -3 {winner = -1}
        
        if winner == 1 {
            resultLabel.text = "Blue Won!"
            resultLabel.isHidden = false
        }else if winner == -1 {
            resultLabel.text = "Red Won!"
            resultLabel.isHidden = false
        }
        if winner != 0 {
            game = [
                [1,1,1],
                [1,1,1],
                [1,1,1],
                ]
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    


}

