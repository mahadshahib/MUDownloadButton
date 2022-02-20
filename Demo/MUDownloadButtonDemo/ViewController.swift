//
//  ViewController.swift
//  MUDownloadButtonDemo
//
//  Created by Mamad Shahib on 11/27/1400 AP.
//

import UIKit
import MUDownloadButton

class ViewController: UIViewController {
    
  
    var index : Float = 0.0
    /// You can init views both in  storyboard and programatically
    @IBOutlet weak var muView: MUDownloadButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ///Set Delegate
        muView.delegate = self
        ///Set currentState -> Default .idle
        muView.currentState = .idle
        ///Set  MainTintColor -> Default UIColor.systemBlue
        muView.mainTintColor = .systemIndigo
        ///Set images of idle and downloaded button , USE SFSYMBOL images that works best , CHANGE BELOW IMAGES BECAUSE THEY ARE NOT EXISTED you will get fatalError
        muView.downloadedButtonImage = UIImage(systemName: "SystemNameOfImage")!
        muView.idleButtonImage = UIImage(systemName: "SystemNameOfImage")!
        
    }

    @IBAction func tapped(_ sender: Any) {
        
       ///Simulate 0 to 100% in 10 seconds
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            /// Set the progress of view like this  - progress is Float between 0.0 - 1.0 - default value is 0
            self.muView.progress = self.index
            self.index += 0.01
        }
    }
}

// MARK: - Delegate
extension ViewController : MUDownloadButtonDelegate {
    /// in this delegate you can specify actions on state change
    /// State enum has 4 case :
    ///    case .idle for idle state before download started
    ///    case .waiting for smoth transition between start download request and actual start
    ///    case .downloadng - progressive state with stop button
    ///    case .downloaded - this is the final level you can use to open file or even reset download
    func didTapButton(_: MUDownloadButton, state: MUDownloadButton.State) {
        switch state {
        case .idle: muView.currentState = .waiting
        case .waiting: muView.currentState = .downloading
        case .downloading: muView.currentState = .downloaded
        case .downloaded: muView.currentState = .idle
        }
    }
}
