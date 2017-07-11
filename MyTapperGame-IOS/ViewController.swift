//
//  ViewController.swift
//  MyTapperGame-IOS
//
//  Created by Daniel on 7/11/17.
//  Copyright © 2017 Daniel Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var score = 0;
    var time = 0;
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
        //Once the game starts, the timer is initialized
        [Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timer)  , userInfo: nil, repeats: true)]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        score = 0;
        time = 60
    }

    @IBAction func tapButtonClicked(_ sender: Any) {
        score += 1
        scoreLabel.text = "Score: \(score)"
        
        
    }
    
    func timer() {
        if time != 0{
         time -= 1
            timeLabel.text = "Time: \(time)"
        } else {
            //Segue to GameOver View
        }
        
    }
    func moveToView(){
        
    }
    

}

