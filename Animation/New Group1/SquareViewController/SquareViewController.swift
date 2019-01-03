//
//  NewViewController.swift
//  Animtaion
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 Student. All positionsrights reserved.
//

import UIKit

class SquareViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = SquareView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onStartButton(_ sender: UIButton) {
        self.rootView?.start()
    }
}
