//
//  File.swift
//  
//
//  Created by Mamad Shahib on 11/29/1400 AP.
//

import Foundation

public protocol MUDownloadButtonDelegate {
    func didTapButton ( _ : MUDownloadButton , state : MUDownloadButton.State)
   
}
extension MUDownloadButtonDelegate {
    func didTapButton ( _ : MUDownloadButton , state : MUDownloadButton.State){}
   
}
