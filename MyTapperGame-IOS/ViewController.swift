//
//  ViewController.swift
//  MyTapperGame-IOS
//
//  Created by Daniel on 7/11/17.
//  Copyright © 2017 Daniel Williams. All rights reserved.
//

import UIKit
import GoogleMobileAds

var score = 0;
var time = 0;

class ViewController: UIViewController, GADBannerViewDelegate {

    var bannerView: GADBannerView!
    var currentTime: Int!
    
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
        
        
        //For Banner ADS
        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        self.view.addSubview(bannerView)
        bannerView.adUnitID = "ca-app-pub-7697702478003807/8126453579"
        bannerView.rootViewController = self
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]

        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(NSLayoutConstraint(item: bannerView, attribute: .bottom,
                                              relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bannerView, attribute: .centerX,
                                              relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        
                bannerView.load(request)
        
        
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        view.addSubview(bannerView)
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
    }
    
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        timer?.invalidate()
        timer = nil
        currentTime = time
        tapToStart.isEnabled = true;
        tapToStart.isUserInteractionEnabled = true;
        tapToStart.isHidden = false;
        
    }
    
   
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        time = currentTime
        
    }
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        timeLabel.text = "Time: \(time)"
    }
    
    func setup(){
        score = 0;
        time = 60;
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

