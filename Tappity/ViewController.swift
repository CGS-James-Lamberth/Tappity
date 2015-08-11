//
//  ViewController.swift
//  Tappity
//

import UIKit

class ViewController: UIViewController {

    // Hello IT1001
    // New comment for the fork activity on Tuesday
    
    // Instance variables
    // New Comment Here
    var score = 0
    var timeRemaining = 15
    var timerRunning = false

    // IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var scoreWordLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var tapMeButton: UIButton!
    // Called when a colored button is tapped
    @IBAction func buttonTapped(sender: UIButton) {

        score++
        scoreLabel.text = String(score)

        if (timerRunning == false) {

            timeRemaining--
            timeRemainingLabel.text = String(timeRemaining)

            var theTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timerTick:"), userInfo: nil, repeats: true)

            timerRunning = true

        }

    }

    func newFeature() {
        println("Hello")
    }
    
    func aNewerFeature() {
        println("Hello, again")
    }
    
    @IBAction func turnFrench(sender: AnyObject) {
        timeLabel.text = "Temps"
        scoreWordLabel.text = "But"
        tapMeButton.setTitle("appuyez sur moi", forState: UIControlState.Normal)
    }
    
    @IBAction func turnEnglish(sender: AnyObject) {
        timeLabel.text = "Time"
        scoreWordLabel.text = "Score"
        tapMeButton.setTitle("Tap Me", forState: UIControlState.Normal)
    }



    // Called each time the NSTimer ticks (every second)
    func timerTick(sender: NSTimer) {

        timeRemaining--
        timeRemainingLabel.text = String(timeRemaining)

        if (timeRemaining <= 0) {

            sender.invalidate()
            timerRunning = false

            let gameOverAlert = UIAlertController(title: "Game Over", message: "Your score is \(score)", preferredStyle: .ActionSheet)

            let dismissAlertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.timeRemaining = 15
                self.score = 0
                self.scoreLabel.text = "0"
                self.timeRemainingLabel.text = "30"
            })
            gameOverAlert.addAction(dismissAlertAction)

            self.presentViewController(gameOverAlert, animated: true, completion: nil)

        }

    }

}

