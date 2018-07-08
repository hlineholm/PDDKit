//
//  Window.swift
//  PDDKit
//
//  Created by Lineholm, Henrik on 2017-10-03.
//  Copyright © 2017 FLIR Instruments. All rights reserved.
//

import Foundation
import UIKit


/**
 Overrides the trait collection of UIWindow by derriving it from a device with 
 an orientation
 */
public class Window: UIWindow {
    private var device: Device
    private var orientation: Orientation
    public init(for device: Device, _ orientation: Orientation, rootViewController: UIViewController? = nil) {
        self.device = device
        self.orientation = orientation
        super.init(frame: device.bounds(for: orientation))
        guard isContainedByScreen else {
            let d = "\(device)".capitalized
            let fs = "\(frame.size)"
            let ss = "\(screen.bounds.size)"
            fatalError("Screen \(ss) doesn't contain window for \(d) \(fs)")
        }
        self.makeKeyAndVisible()
        self.rootViewController = rootViewController
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override var rootViewController: UIViewController? {
        didSet {
            adjustToPlaygroundScreen()
        }
    }
    public override var traitCollection: UITraitCollection {
        return createTraitCollection(for: device, orientation)
    }
}
public extension UIWindow {
    internal var isContainedByScreen: Bool {
        return screen.bounds.contains(frame)
    }
}
