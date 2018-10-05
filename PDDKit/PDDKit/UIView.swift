//
//  UIView.swift
//  PDDKit
//
//  Created by Henrik Lineholm on 2017-10-11.
//

import Foundation

extension UIView {
    /**
     Adjusts the frame of the view to the playground screen, which has a fixed
     size of an iPad, when the frame is partially visible
     */
    public func adjustToPlaygroundScreen() {
        let x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = frame.width
        let h: CGFloat = frame.height + 1
        frame = CGRect(x: x, y: y, width: w, height: h)
    }
}
