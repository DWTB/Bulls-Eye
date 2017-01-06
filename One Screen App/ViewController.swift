//
//  ViewController.swift
//  One Screen App
//
//  Created by Ashton Walden on 1/6/17.
//  Copyright © 2017 RelativeDecay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //Declarations
    var currentValue: Int = 0
    var targetValue: Int = 0
    var round: Int = 0
    var score: Int = 0
    var points: Int = 0
    var difference: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //New round
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    //Restart
    @IBAction func restart(){
        score = 0
        points = 0
        round = 0
        startNewRound()
        
    }
    
    // Score
    func updateScore(){
        score += points
        scoreLabel.text = String(score)
        
    }
    
    //Update Labels
    
    func updateLabels(){
        updateScore()
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    //Handeling alerts
    @IBAction func showAlert() {
        difference = Int(abs(targetValue-currentValue))
        points = 100 - difference
        let message = "The value of the slider is: \(currentValue)" + "\nThe difference: \(difference)"
        
        let alert = UIAlertController(title: "Hit", message: message, preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
        alert.addAction(action)
    
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    //Handeling the value of the slider
    
    @IBAction func sliderMoved(_ slider: UISlider){
          currentValue = lroundf(slider.value)
    }

}

