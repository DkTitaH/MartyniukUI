//
//  labelView.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    struct Strings {
        
        static let start = "Start"
        static let stop = "Stop"
    }
    
    struct Durations {
        
        static let oneSecond = 1.0
        static let zero = 0.0
    }
    
    @IBOutlet var startButton: UIButton?
    
    @IBOutlet var square: Square?
    
    var isMoving: Bool {
        get { return self.privateIsMoving}
        set {
            self.privateIsMoving = newValue
            let string = self.privateIsMoving ? Strings.stop : Strings.start
            self.startButton?.setTitle(string, for: .normal)
        }
    }
    
    private let generator = Generator<CGRect.Position>(objects: .topLeft, .bottomLeft, .bottomRight, .topRight)
    
    private(set) var isAnimating = true
    private var privateIsMoving = false
    private var animated = false
    
    func moving() {
        self.isMoving = !self.isMoving
        
        if self.isMoving && !self.animated {
            self.setPosition(duration: Durations.oneSecond, animating: self.isAnimating)
        }
    }
    
    private func setPosition(duration: TimeInterval, animating: Bool) {
        UIView.animate(
            withDuration: animating ? Durations.oneSecond : Durations.zero,
            animations: {
                self.animated = true
                self.changePosition()
            },
            completion: { bool in
                if self.isMoving {
                    self.setPosition(duration: duration, animating: animating)
                } else {
                    self.animated = false
                }
            }
        )
    }

    private func changePosition() {
        func safeAreaInsets(of insets: UIEdgeInsets, for square: Square) -> UIEdgeInsets {
            let squareSide = square.frame.width
            
            let top = insets.top
            let left = insets.left
            let bottom = insets.bottom + squareSide
            let right = insets.right + squareSide
            
            return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        }
        
        self.square.do {
            let newInsets = safeAreaInsets(of: self.safeAreaInsets, for: $0)
            let nextPoint = self.frame.inset(by: newInsets).point(at: self.generator.next())
            $0.frame.origin = nextPoint
        }
    }
}
