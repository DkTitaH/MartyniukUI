//
//  labelView.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    enum State: String {
        case Start
        case Stop
    }
    
    
    @IBOutlet var startButton: UIButton?
    
    @IBOutlet var isAnimated: UISwitch?
    
    @IBAction func onSwitch(_ sender: Any) {
        self.isMoving = false
    }
    
    var isCancelled: Bool {
        return !self.isMoving
    }
    
    private let generator = Generator<CGRect.Position>(objects: .topLeft, .bottomLeft, .bottomRight, .topRight)
    
    private let animationDuration = 1.0
    
    private lazy var square: Square = {
        let origin = self.frame.inset(by: self.safeAreaInsets).topLeft
        let rect = CGRect(origin: origin, size: CGSize(width: 100, height: 100))
        let square = Square(frame: rect)
        square.backgroundColor = .green

        return square
    }()
    
    private var position = CGRect.Position.topLeft
    private var isMoving = false
    private var animated = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(self.square)
    }
    
    func start() {
        self.isMoving = !self.isMoving
        
        if self.isMoving && !self.animated {
            self.startButton?.setTitle(State.Stop.rawValue, for: .normal)
            self.setPositionAnimate(duration: self.animationDuration, animated: self.isAnimated?.isOn ?? false)
        } else {
            self.startButton?.setTitle(State.Start.rawValue, for: .normal)
        }
    }
    
    private func setPositionAnimate(duration: TimeInterval,animated: Bool) {
        UIView.animate(
            withDuration: animated ? 1 : 0,
            animations: {
                self.animated = true
                self.setPosition()
            },
            completion: { bool in
                if self.isMoving {
                    self.setPositionAnimate(duration: duration, animated: animated)
                } else {
                    self.animated = false
                }
            }
        )
    }

    private func setPosition() {
        self.position = self.generator.next()
        let positions = self.positions()
        
        self.square.frame.origin = positions[self.position] ?? .zero
    }
    
    private func positions() -> [CGRect.Position : CGPoint] {
        let screen = self.frame.inset(
            by: UIEdgeInsets(
                top: self.safeAreaInsets.top,
                left: 0,
                bottom: self.square.frame.height,
                right: self.square.frame.width
            )
        )
        
        return [
            .topLeft: screen.topLeft,
            .bottomLeft: screen.bottomLeft,
            .bottomRight: screen.bottomRight,
            .topRight: screen.topRight
        ]
    }
}
