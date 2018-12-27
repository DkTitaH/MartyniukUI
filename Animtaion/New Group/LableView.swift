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
        let positions = self.lable.positions()
        
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
        
        if let position = position { self.lable.frame.origin = position }
    }
}
