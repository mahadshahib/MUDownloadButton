//
//  File.swift
//  
//
//  Created by Mamad Shahib on 11/29/1400 AP.
//

import UIKit
@available(iOS 13.0, *)
final class RoundButton: UIButton {
    
    // MARK: Properties
    
    var image = UIImage(systemName: "arrow.down.circle") {
        didSet {
            commonInit()
        }
    }

    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: Helper methods

    private func commonInit() {
        self.setBackgroundImage(image, for: .normal)

    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
}
