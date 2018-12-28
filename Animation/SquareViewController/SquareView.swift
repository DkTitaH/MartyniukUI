//
//  labelView.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareView: UIView {

    @IBOutlet var label: AnimatedSquare!
    
    func setPositionAnimate(duration: TimeInterval,animated: Bool, completion: @escaping () -> ()) {
        if let label = self.label {
            if animated {
                UIView.animate(
                    withDuration: duration,
                    animations: {
                        label.isAnimated = true
                        self.setPosition()
                    },
                    completion: { bool in
                        completion()
                        if label.isMoving {
                            self.setPositionAnimate(duration: duration, animated: animated, completion: completion)
                        } else {
                            label.isAnimated = false
                        }
                    }
                )
            } else {
                self.setPosition()
                label.isMoving = false
            }
        }
    }

    private func setPosition() {
        var position = self.label?.frame.origin
        let positions = self.label.positions()
        
        switch position {
        case positions[.topLeft]:
            position = positions[.bottomLeft];
        case positions[.topRight]:
            position = positions[.topLeft];
        case positions[.bottomLeft]:
            position = positions[.bottomRight];
        case positions[.bottomRight]:
            position = positions[.topRight];
        default: return
        }
        
        if let position = position { self.label.frame.origin = position }
    }
}
