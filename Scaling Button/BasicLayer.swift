//
//  BasicLayer.swift
//  Scaling Button
//
//  Created by ChinChin on 2017/4/20.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class BasicLayer: CALayer {
    weak var fancyButton: ScalingButton?
    
    override func draw(in ctx: CGContext) {
        if let fancyButton = fancyButton {
            
            let cornerRadious = bounds.height * fancyButton.curvaceousness
            let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadious)
            
            ctx.addPath(path.cgPath)
            ctx.setFillColor(fancyButton.basicColor.cgColor)
            ctx.fillPath()
            
        }
    }
}
