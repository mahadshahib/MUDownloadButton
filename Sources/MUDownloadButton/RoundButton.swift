//
//  File.swift
//  
//
//  Created by Mamad Shahib on 11/29/1400 AP.
//

import UIKit

final class RoundButton: UIButton {
    
    // MARK: Properties
    
    var highlightedBackgroundColor = UIColor.lightGray {
        didSet {
            updateColors()
        }
    }
    
    var nonhighlightedBackgroundColor = UIColor.systemGray3 {
        didSet {
            updateColors()
        }
    }
    
    var highlightedTitleColor = UIColor.systemBlue {
        didSet {
            updateColors()
        }
    }
    
    var nonhighlightedTitleColor = UIColor.systemBlue {
        didSet {
            updateColors()
        }
    }

    override var isHighlighted: Bool {
        didSet {
            updateColors()
        }
    }

    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateColors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateColors()
    }
    
    // MARK: Helper methods

    private func updateColors() {
        backgroundColor = isHighlighted ? highlightedBackgroundColor : nonhighlightedBackgroundColor
        let titleColor = isHighlighted ? highlightedTitleColor : nonhighlightedTitleColor
        setTitleColor(titleColor, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
}
