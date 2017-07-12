//
//  GameOverViewController.swift
//  MyTapperGame-IOS
//
//  Created by Daniel on 7/11/17.
//  Copyright © 2017 Daniel Williams. All rights reserved.
//

import UIKit
import GoogleMobileAds


class GameOverViewController: UIViewController {
   // var interstitial: GADInterstitial!
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet weak var tapsPerSecondLabel: UILabel!
    
    var tapsPerSecond = score / 60;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        tapsPerSecondLabel.text = "\(tapsPerSecond) taps/sec"
        // Do any additional setup after loading the view.
        
        /* Under Dev in different branch!
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-7697702478003807/3057125575")
        let request = GADRequest()
        interstitial.load(request)
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func restartButtonTapped(_ sender: Any) {
        /*
        if interstitial.isReady{
            interstitial.present(fromRootViewController: self)
        } else{
            print("Ad wasn't ready!")
        }
 */
        
        moveToGameView()
    }
    
    @IBAction func mainMenuButtonTapped(_ sender: Any) {
       moveToMainView()
    }
    
    
    func moveToGameView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC = storyboard.instantiateViewController(withIdentifier: "GameVC") as UIViewController
        present(gameVC, animated: true, completion: nil)
        
    }
    
    func moveToMainView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainMenuVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as UIViewController
        present(mainMenuVC, animated: true, completion: nil)
        
    }


}
