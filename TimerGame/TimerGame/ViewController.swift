//
//  ViewController.swift
//  Timer
//
//  Created by Татьяна Денисова on 19/08/2018.
//  Copyright © 2018 Татьяна Денисова. All rights reserved.
//

import UIKit


class ViewController: UIViewController, DelegateProtocol {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var targetLabel: UILabel!
    
    var targetValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainButton.layer.cornerRadius = 90
        mainButton.backgroundColor = .clear
        mainButton.layer.borderWidth = 10
        mainButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        StartOver(text: "start")
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(LongTap(_:)))
        longGesture.minimumPressDuration = 0
        mainButton.addGestureRecognizer(longGesture)
    }
    var counter = 0.1
    var timer = Timer()
    var isTimerRunning = false
    
    func StartOver(text: String) {
        print(text)
        targetValue = 1 + Int(arc4random_uniform(10))
        targetLabel.text = String(targetValue)
    }
    
    @objc func updateTimer() {
        counter += 0.1
        print(counter)
    }
    
    func startTimer() {
        mainButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        counter = 0.0
        if !isTimerRunning {
            isTimerRunning = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    func stopTimer() {
        mainButton.backgroundColor = .clear
        timer.invalidate()
        isTimerRunning = false
        performSegue(withIdentifier: "result", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let destination : ResultViewController = segue.destination as! ResultViewController
            destination.counterPassedOver = counter
            destination.targetValuePassedOver = targetValue
        }
    }
    
    @objc func LongTap(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            stopTimer()
        } else if sender.state == .began {
            startTimer()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
