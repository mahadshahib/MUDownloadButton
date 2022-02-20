//
//  File.swift
//  
//
//  Created by Mamad Shahib on 11/29/1400 AP.
//

import Foundation
@available(iOS 13.0, *)
public protocol MUDownloadButtonDelegate {
    @available(iOS 13.0, *)
    func didTapButton ( _ : MUDownloadButton , state : MUDownloadButton.State)
   
}
@available(iOS 13.0, *)
extension MUDownloadButtonDelegate {
    @available(iOS 13.0, *)
    func didTapButton ( _ : MUDownloadButton , state : MUDownloadButton.State){}
   
}
