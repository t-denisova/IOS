//
//  ResultViewController.swift
//  Timer
//
//  Created by Татьяна Денисова on 20/08/2018.
//  Copyright © 2018 Татьяна Денисова. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var counterPassedOver: Double?
    var targetValuePassedOver: Int?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    
    @IBAction func PlayAgain(_ sender: Any) {
        print("exit")
        dismiss(animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let counter = counterPassedOver {
            culcResult(counter)
            counterLabel.text = String(format: "%.1f", counter)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func culcResult (_ counter: Double) {
        let newImg: UIImage? = UIImage(named: "starfull")
        if let targetValue = targetValuePassedOver {
            let result = Double(targetValue) - counter
            if abs(result) <= 0.01{
                resultLabel.text = "Exellent"
                self.star1.image = newImg
                self.star2.image = newImg
                self.star3.image = newImg
            } else if abs(result) <= 0.2 {
                resultLabel.text = "Great"
                self.star1.image = newImg
                self.star2.image = newImg
            }  else if abs(result) <= 2.0 {
                resultLabel.text = "Nice"
                self.star1.image = newImg
            } else if abs(result) > 2.0 {
                resultLabel.text = "Could be better"

            }
        }
    }
}
