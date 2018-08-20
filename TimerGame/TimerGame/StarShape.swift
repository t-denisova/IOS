//
//  StarShape.swift
//  Timer
//
//  Created by Татьяна Денисова on 20/08/2018.
//  Copyright © 2018 Татьяна Денисова. All rights reserved.
//

import UIKit


class StarShape: UIViewController {
    
    func draw(_ rect: CGRect) {
        let color = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        
        //// Star Drawing
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 41.5, y: 8))
        starPath.addLine(to: CGPoint(x: 51.34, y: 28.96))
        starPath.addLine(to: CGPoint(x: 74.31, y: 31.84))
        starPath.addLine(to: CGPoint(x: 57.41, y: 47.67))
        starPath.addLine(to: CGPoint(x: 61.78, y: 70.41))
        starPath.addLine(to: CGPoint(x: 41.5, y: 59.23))
        starPath.addLine(to: CGPoint(x: 21.22, y: 70.41))
        starPath.addLine(to: CGPoint(x: 25.59, y: 47.67))
        starPath.addLine(to: CGPoint(x: 8.69, y: 31.84))
        starPath.addLine(to: CGPoint(x: 31.66, y: 28.96))
        starPath.close()
        color.setFill()
        starPath.fill()
        color.setStroke()
        starPath.lineWidth = 5
        starPath.stroke()
    }
}
