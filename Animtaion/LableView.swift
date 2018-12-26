//
//  LableView.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class LableView: UIView {
    
    enum Lable: String {
        case Start = "Start"
        case Stop = "Stop"
    }

    @IBOutlet var lable: AnimatedSquare?
    
    private let duration = TimeInterval(exactly: 1.0)
    
    @IBAction func button(_ sender: UIButton) {
        if let lable = self.lable {
            lable.isRunning = !lable.isRunning
            
            if lable.isRunning && !lable.isAnimated {
                if let duration = self.duration { self.setPositionAnimate(duration: duration) }
            }
        }
    }
    
    func setPositionAnimate(duration: TimeInterval) {
        if let lable = self.lable {
            UIView.animate(
                withDuration: 1,
                animations: {
                    lable.isAnimated = true
                    self.setPosition()
                },
                completion: { bool in
                    if lable.isRunning {
                        self.setPositionAnimate(duration: duration)
                    } else {
                        lable.isAnimated = false
                    }
                }
            )
        }
    }

    func setPosition() {
        var position = self.lable?.frame.origin
        
        switch position {
        case self.lable?.positions[.topLeft]: position = self.lable?.positions[.downLeft];
        case self.lable?.positions[.topRight]: position = self.lable?.positions[.topLeft];
        case self.lable?.positions[.downLeft]: position = self.lable?.positions[.downRight];
        case self.lable?.positions[.downRight]: position = self.lable?.positions[.topRight];
        default: return
        }
        
        if let position = position { self.lable?.frame.origin = position }
    }
}
