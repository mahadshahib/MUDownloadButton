

import UIKit

public final class MUDownloadButton: UIView {
    
    // MARK: - States
    public enum State {
        case idle
        case waiting
        case downloading
        case downloaded
    }
    
    // MARK: - Attributes , Colors and Fonts
    public var mainTintColor : UIColor = .systemBlue
    public var currentState : State = .idle {
        didSet {
            // MARK: - Current State Changed
        }
    }
    // MARK: - Private Properties
    
    let idleButton : RoundButton = {
        let button = RoundButton()
        button.nonhighlightedBackgroundColor = .black
        button.addTarget(self, action: #selector(currentButtonTapped), for: .touchUpInside)
        return button
    }
    let waitingView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    let downloadingButton : RoundButton = {
        let button = RoundButton()
        button.nonhighlightedBackgroundColor = .orange
        button.addTarget(self, action: #selector(currentButtonTapped), for: .touchUpInside)
        return button
    }
    let downloadedButton : RoundButton = {
        let button = RoundButton()
        button.nonhighlightedBackgroundColor = .red
        button.addTarget(self, action: #selector(currentButtonTapped), for: .touchUpInside)
        return button
    }
    
    // MARK: - Inits
    
    public override init(frame: CGRect) {
        contentHorizontalAlignment = .center
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        contentHorizontalAlignment = .center
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        /// add subviews and add constraints
        self.addSubview(idleButton)
        
        
        self.addSubview(waitingView)
        
        
        
        self.addSubview(downloadingButton)
        
        
        
        self.addSubview(downloadedButton)
    }
}

