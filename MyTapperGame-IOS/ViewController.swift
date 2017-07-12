//
//  ViewController.swift
//  MyTapperGame-IOS
//
//  Created by Daniel on 7/11/17.
//  Copyright © 2017 Daniel Williams. All rights reserved.
//

import UIKit

var score = 0;
var time = 0;

class ViewController: UIViewController {

    
    @IBOutlet weak var tapToStart: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    enum gameState {
        case beforeGame;
        case duringGame;
        case afterGame;
    }
    
    var timer: Timer?;
    
    var currentGameState = gameState.beforeGame
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
        currentGameState = gameState.beforeGame
        //Once the game starts, the timer is initialized
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        score = 0;
        time = 15;
        tapToStart.isEnabled = true;
        tapToStart.isUserInteractionEnabled = true;
        tapToStart.isHidden = false;
        
    }

    @IBAction func tapButtonClicked(_ sender: Any) {
        if(time != 0 && currentGameState == gameState.duringGame) {
        score += 1
        scoreLabel.text = "Score: \(score)"
        }
        
    }
    
    func countDownTimer() {
        if time != 0{
         time -= 1
            timeLabel.text = "Time: \(time)"
        } else {
            //Segue to GameOver View
            timer?.invalidate()
            timer = nil
            moveToView()
                    }
        
    }
    
    @IBAction func tapToStartTapped(_ sender: Any) {
        tapToStart.isEnabled = false;
        tapToStart.isUserInteractionEnabled = false
        tapToStart.isHidden = true
        currentGameState = .duringGame
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDownTimer)  , userInfo: nil, repeats: true)
        timeLabel.text = "Time: \(time)"
    }
    
    
    
    func moveToView(){
        
       self.performSegue(withIdentifier: "segue", sender: nil)
 
        
        
    }
    

}

