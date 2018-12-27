//
//  NewViewController.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All positionsrights reserved.
//

import UIKit

class SquareViewController: UIViewController {

    @IBOutlet var lableView: LableView!
    
    @IBOutlet var isAnimated: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lableView.lable.frame.origin = UIScreen.main.bounds.origin
    }

    @IBAction func changeMode(_ sender: UISwitch) {
        self.lableView.lable.isMoving = false
    }
    
    @IBAction func click(_ sender: UIButton) {
        let positions = self.lableView.lable.positions()
        
        if let lable = self.lableView.lable {
            lable.isMoving = !lable.isMoving
            
            if lable.isMoving && !lable.isAnimated {
                self.lableView.setPositionAnimate(duration: lable.animationDuration, animated: self.isAnimated.isOn) {
                    positions.forEach {
                        if lable.frame.origin == $0.value {
                            lable.location = $0.key
                        }
                    }
                }
            }
        }
    }
}
