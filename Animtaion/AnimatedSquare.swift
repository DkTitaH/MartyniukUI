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
        return !self.isRunning
    }
    
    var location: Location {
        get { return self.position }
        set { self.position = newValue }
    }

    public let positions = [Location.topLeft: CGPoint(x: 20.0, y: 44),
                            Location.downLeft: CGPoint(x: 20, y: 780),
                            Location.downRight: CGPoint(x: 280.0, y: 780),
                            Location.topRight: CGPoint(x: 280.0, y: 44)]
    
    public var isRunning = false
    public var isAnimated = false
    
    private var position = Location.topLeft
}
