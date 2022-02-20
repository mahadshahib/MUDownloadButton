

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
    public var mainTintColor : UIColor = .systemIndigo {
        didSet {
            idleButton.tintColor = mainTintColor
            waitingView.strokeColor = mainTintColor
            downloadingButton.mainTintColor = mainTintColor
            downloadedButton.tintColor = mainTintColor
        }
    }
    public var idleButtonImage : UIImage = UIImage(systemName: "arrow.down.circle")! {
        didSet {
            self.idleButton.setBackgroundImage(idleButtonImage, for: .normal)
        }
    }
    public var downloadedButtonImage : UIImage = UIImage(systemName: "play.circle.fill")! {
        didSet {
            self.idleButton.setBackgroundImage(idleButtonImage, for: .normal)
        }
    }
    public var progress : Float = 0 {
        didSet  {
            downloadingButton.progress = progress
        }
    }
    public var animationDuration  = 0.3
    public var currentState : State = .idle {
        didSet {
            // MARK: - Current State Changed
            let delay : TimeInterval = 0
            self.delegate?.muDownloadButton(self, stateDidChangeTo: currentState)
            animationQueue.async { [self] in
                animationDispatchGroup.enter()
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    transition(from: oldValue, to: currentState)
                }
                animationDispatchGroup.wait()
            }
        }
    }
    // MARK: - Private Properties
    
    let idleButton : RoundButton = {
        let button = RoundButton()
        button.addTarget(self, action: #selector(currentButtonTapped), for: .touchUpInside)
        return button
    }()
    let waitingView : WaitingView = {
        let view = WaitingView()
        
        return view
    }()
    let downloadingButton : ProgressButton = {
        let button = ProgressButton()
        
        return button
    }()
    let downloadedButton : RoundButton = {
        let button = RoundButton()
        button.addTarget(self, action: #selector(currentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - CallBacks
    
    // MARK: - Delegate and GCD
    var delegate : MUDownloadButtonDelegate?
    let animationDispatchGroup = DispatchGroup()
    let animationQueue = DispatchQueue(label: "MUDownloadButtonAnimationQueue")
    
    // MARK: - Inits
    
    public override init(frame: CGRect) {

        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {

        /// add subviews and add constraints
        self.addSubview(idleButton)
        self.setIdleButtonConstraints()
        self.idleButton.image = idleButtonImage
        idleButton.tintColor = mainTintColor
        
        
        self.addSubview(waitingView)
        self.setWaitingButtonConstraints()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(currentButtonTapped))
        waitingView.addGestureRecognizer(tapGesture)
        waitingView.strokeColor = mainTintColor
        
        
        self.addSubview(downloadingButton)
        self.setDownloadingButtonConstraints()
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(currentButtonTapped))
        downloadingButton.addGestureRecognizer(tapGesture2)
        progress = 0
        downloadingButton.mainTintColor = mainTintColor
        
        self.addSubview(downloadedButton)
        self.setDownloadedButtonConstraints()
        self.downloadedButton.image = downloadedButtonImage
        downloadedButton.tintColor = mainTintColor
    }
    
    
    // MARK: - Setup Constraitns
    internal func setIdleButtonConstraints() {
        idleButton.pinToSuperview()
    }
    internal func setWaitingButtonConstraints() {
        waitingView.pinToSuperview(constant: 2)
    }
    internal func setDownloadingButtonConstraints() {
        downloadingButton.pinToSuperview()
    }
    internal func setDownloadedButtonConstraints() {
        downloadedButton.pinToSuperview()
    }
    
    
    // MARK: - Actions
    
    @objc private func currentButtonTapped(_ sender: UITapGestureRecognizer? = nil) {
        print("tap0ped")
        delegate?.didTapButton(self, state: currentState)
    }
}

