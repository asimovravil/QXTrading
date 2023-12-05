//
//  CircularProgressBar.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit

enum ProgressBarMode {
    case dayBased(totalDays: Int)
    case percentageBased
}

class CircularProgressBar: UIView {
    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    
    var progressBarMode: ProgressBarMode = .dayBased(totalDays: 30)
    
    var lineWidth: CGFloat = 7.0 {
        didSet {
            trackLayer.lineWidth = lineWidth
            progressLayer.lineWidth = lineWidth
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
    }
    
    private func createCircularPath() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.size.width / 2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2), radius: (frame.size.width - 1.5) / 2, startAngle: -(.pi / 2), endAngle: .pi * 1.5, clockwise: true)
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = R.color.circular()?.cgColor
        trackLayer.lineWidth = lineWidth
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = R.color.tabBarTint()?.cgColor
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Int) {
        var progress: Float = 0.0
        
        switch progressBarMode {
        case .dayBased(let totalDays):
            progress = Float(value) / Float(totalDays)
        case .percentageBased:
            progress = Float(value) / 100.0
        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = progress
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(progress)
        progressLayer.add(animation, forKey: "animateprogress")
    }
}
