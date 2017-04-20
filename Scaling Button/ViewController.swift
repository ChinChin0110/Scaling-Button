//
//  ViewController.swift
//  Scaling Button
//
//  Created by ChinChin on 2017/4/20.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scalingButton = ScalingButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scalingButton)
        scalingButton.addTarget(self, action: #selector(handleTouchDown), for: .primaryActionTriggered)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bounds = UIScreen.main.bounds
        scalingButton.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        scalingButton.center = CGPoint(x: bounds.width / 2 ,y: bounds.height / 2)

    }

    func handleTouchDown(scalingButton: ScalingButton) {
        print("button did trigger")
    }
    
}

