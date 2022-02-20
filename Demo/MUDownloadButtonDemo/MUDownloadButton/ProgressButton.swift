//
//  ProgressButton.swift
//  MUDownloadButtonDemo
//
//  Created by Mamad Shahib on 11/29/1400 AP.
//

import UIKit

class ProgressButton: UIButton {
    
    
    // MARK: - Properties
    var mainTintColor : UIColor = .systemBlue  {
        didSet {
            circleLayer.strokeColor = mainTintColor
            cubeView.backgroundColor = mainTintColor
        }
    }
    
    
    /// progress is Float in rage of  0.00 - 1.00
    var progress : Float = 0 {
        didSet {
            animateProgress(from: circleLayer.circleLayer.strokeEnd, to: CGFloat(progress))
        }
    }
    
        var circleLayer : WaitingView = {
            let layer = WaitingView()
           
            layer.rotationStartingAngle = -CGFloat.pi/2
            layer.rotationEndingAngle = layer.rotationStartingAngle + 2*CGFloat.pi
            layer.shouldSpin = false
            layer.isClockwise = true
            return layer
        }()
        
     let cubeView: UIView = {
        let view = UIView()
       
        view.layer.cornerRadius = 3
        return view
    }()
    
        
        // MARK: Initializers
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            backgroundColor = .clear
            /// progress circle view
            circleLayer.strokeColor = mainTintColor
            self.addSubview(circleLayer)
            circleLayer.pinToSuperview()
            
            /// cube stop view
            cubeView.backgroundColor = mainTintColor
            self.addSubview(cubeView)
            cubeView.translatesAutoresizingMaskIntoConstraints = false
            cubeView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
            cubeView.widthAnchor.constraint(equalTo: cubeView.heightAnchor, multiplier: 1).isActive = true
            cubeView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            cubeView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
        }
    
    private func animateProgress(from startValue: CGFloat? = 0, to endValue: CGFloat) {

        circleLayer.circleLayer.strokeEnd = endValue
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.fromValue = startValue
        animation.duration = 0.3
        circleLayer.circleLayer.add(animation, forKey: nil)
    }

    }


