//
//  ScalingButton.swift
//  Scaling Button
//
//  Created by ChinChin on 2017/4/20.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit
import AudioToolbox

class ScalingButton: UIControl {
    
    fileprivate var basicLayer = BasicLayer()
    fileprivate let animate = CABasicAnimation()
    
    var curvaceousness: CGFloat = 0.3 {
        didSet {
            basicLayer.setNeedsDisplay()
        }
    }
    
    var basicColor: UIColor = UIColor(white: 0.9, alpha: 1.0) {
        didSet {
            basicLayer.setNeedsDisplay()
        }
    }
    
    var durationTime: Double = 0.3 {
        didSet {
            animate.duration = durationTime
        }
    }
    
    var scalingRatio: Double = 1.5 {
        didSet {
            animate.toValue = scalingRatio
        }
    }
    
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        basicLayer.fancyButton = self
        
        basicLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(basicLayer)
        
        updateLayerFrames()
        
        animate.keyPath = "transform.scale"
        animate.duration = durationTime
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func updateLayerFrames() {
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        basicLayer.frame = bounds.insetBy(dx: 0.0, dy: 0.0)
        basicLayer.setNeedsDisplay()
        
        CATransaction.commit()
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        if basicLayer.frame.contains(location) {
            
            animate.fromValue = 1.0
            animate.toValue = scalingRatio
            animate.beginTime = CACurrentMediaTime()
            basicLayer.add(animate, forKey: "scale")
            
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let elapsedTime = CACurrentMediaTime() - animate.beginTime
        
        if elapsedTime >= animate.duration * 0.9 {
            AudioServicesPlaySystemSound(1519)
            sendActions(for: .primaryActionTriggered)
            return false
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        basicLayer.removeAnimation(forKey: "scale")
        let elapsedTime = CACurrentMediaTime() - animate.beginTime
        let time = animate.duration - elapsedTime
        animate.beginTime = CACurrentMediaTime() - time
        
        animate.fromValue = scalingRatio
        animate.toValue = 1.0
        
        basicLayer.add(animate, forKey: nil)
    }
    

}
