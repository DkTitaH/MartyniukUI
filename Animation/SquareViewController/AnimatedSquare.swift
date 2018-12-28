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
        case bottomLeft
        case bottomRight
        case topRight
    }
    
    var isCancelled: Bool {
        return !self.isMoving
    }
    
    var location: Location {
        get { return self.position }
        set { self.position = newValue }
    }


    public func positions() -> [Location:CGPoint] {
        let screenSize = UIScreen.main.bounds
        let labelSize = self.bounds
        
        return [Location.topLeft: screenSize.origin,
                .bottomLeft: .init(x: screenSize.minX, y: screenSize.maxY - labelSize.height),
                .bottomRight: .init(x: screenSize.maxX - labelSize.width, y: screenSize.maxY - labelSize.height),
                .topRight: .init(x: screenSize.maxX - labelSize.width, y: screenSize.minY)]
    }
    
    public var isMoving = false
    public var isAnimated = false
    public let animationDuration = 1.0
    
    private var position = Location.topLeft
}
