//
//  LableView.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class LableView: UIView {

    @IBOutlet var lable: AnimatedSquare!
    
    func setPositionAnimate(duration: TimeInterval,animated: Bool, completion: @escaping () -> ()) {
        if let lable = self.lable {
            if animated {
                UIView.animate(
                    withDuration: duration,
                    animations: {
                        lable.isAnimated = true
                        self.setPosition()
                    },
                    completion: { bool in
                        completion()
                        if lable.isMoving {
                            self.setPositionAnimate(duration: duration, animated: animated, completion: completion)
                        } else {
                            lable.isAnimated = false
                        }
                    }
                )
            } else {
                self.setPosition()
                lable.isMoving = false
            }
        }
    }

    private func setPosition() {
        var position = self.lable?.frame.origin
        
        switch position {
        case self.lable.positions[.topLeft]:
            position = self.lable.positions[.downLeft];
        case self.lable.positions[.topRight]:
            position = self.lable.positions[.topLeft];
        case self.lable.positions[.downLeft]:
            position = self.lable.positions[.downRight];
        case self.lable.positions[.downRight]:
            position = self.lable.positions[.topRight];
        default: return
        }
        
        if let position = position { self.lable.frame.origin = position }
    }
}
