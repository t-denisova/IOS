//
//  ResultViewController.swift
//  Timer
//
//  Created by Татьяна Денисова on 20/08/2018.
//  Copyright © 2018 Татьяна Денисова. All rights reserved.
//

import UIKit

protocol DelegateProtocol {
    func StartOver(text: String)
}

class ResultViewController: UIViewController {
    var counterPassedOver: Double?
    var targetValuePassedOver: Int?
    
    var delegate: DelegateProtocol?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    var counter = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let counter = counterPassedOver {
            culcResult(counter)
            counterLabel.text = String(format: "%.1f", counter)
        }
       
       StartTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func culcResult (_ counter: Double) {
        if let targetValue = targetValuePassedOver {
            let result = Double(targetValue) - counter
            if abs(result) <= 0.2 {
                resultLabel.text = "Exelent"
            } else if abs(result) <= 0.5 {
                resultLabel.text = "Greate"
            }  else if abs(result) <= 1.0 {
                resultLabel.text = "Nice"
            } else if abs(result) > 1.0 {
                resultLabel.text = "Not even close"
            }
        }
    }
    
    func StartTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateCounter), userInfo: nil, repeats: true)
    }
    @objc func UpdateCounter() {
        counter += 1
        if counter == 4 {
            delegate?.StartOver(text: "inputText")
            dismiss(animated: false, completion: nil)
        }
    }
}
