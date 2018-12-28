//
//  NewViewController.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All positionsrights reserved.
//

import UIKit

class SquareViewController: UIViewController {

    @IBOutlet var isAnimated: UISwitch!
    
    public var labelView: SquareView? {
        if self.isViewLoaded {
            return self.view as? SquareView
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelView?.label.frame.origin = UIScreen.main.bounds.origin
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        self.labelView?.label.isMoving = false
    }
    
    @IBAction func onStartButton(_ sender: UIButton) {
        let positions = self.labelView?.label.positions()
        
        if let label = self.labelView?.label {
            label.isMoving = !label.isMoving
            
            if label.isMoving && !label.isAnimated {
                self.labelView?.setPositionAnimate(duration: label.animationDuration, animated: self.isAnimated.isOn) {
                    positions?.forEach {
                        if label.frame.origin == $0.value {
                            label.location = $0.key
                        }
                    }
                }
            }
        }
    }
}
