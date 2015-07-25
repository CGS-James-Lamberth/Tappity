//
//  ViewController.swift
//  Tappity
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    var timeRemaining = 30
    var timerRunning = false

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!

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

    func timerTick(sender: NSTimer) {

        timeRemaining--
        timeRemainingLabel.text = String(timeRemaining)

        if (timeRemaining <= 0) {

            sender.invalidate()
            timerRunning = false

            let gameOverAlert = UIAlertController(title: "Game Over", message: "Your score is \(score)", preferredStyle: .ActionSheet)

            let dismissAlertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.timeRemaining = 30
                self.score = 0
                self.scoreLabel.text = "0"
                self.timeRemainingLabel.text = "30"
            })
            gameOverAlert.addAction(dismissAlertAction)

            self.presentViewController(gameOverAlert, animated: true, completion: nil)

        }

    }

}
