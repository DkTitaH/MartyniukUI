//
//  AnimatedSquare.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class AnimatedSquare: UILabel {
    
    enum Location {
        case topLeft
        case downLeft
        case downRight
        case topRight
    }
    
    var isCancelled: Bool {
        return !self.isMoving
    }
    
    var location: Location {
        get { return self.position }
        set { self.position = newValue }
    }

    public let positions = [Location.topLeft: CGPoint(x: 20.0, y: 44),
                            .downLeft: .init(x: 20, y: 780),
                            .downRight: .init(x: 280.0, y: 780),
                            .topRight: .init(x: 280.0, y: 44)]
    
    public var isMoving = false
    public var isAnimated = false
    public let animationDuration = 1.0
    
    private var position = Location.topLeft
}
