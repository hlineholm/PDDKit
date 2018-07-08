//
//  createParent.swift
//  PDDKit
//
//  Created by Lineholm, Henrik on 2017-10-03.
//  Copyright © 2017 FLIR Instruments. All rights reserved.
//

import Foundation
import UIKit


/**
 Creates a parent view controller that represents a specific device, orientation 
 with specific traits and adds the view controller as a child overriding its trait 
 collection.
 
 - parameter child: An controller to put inside the parent controller.
 - parameter device: The device the controller should represent.
 - parameter orientation: The orientation of the device.
 - parameter additionalTraits: An optional set of traits that will also be applied. 
 Traits in this collection will trump any traits derived from the device/orientation
 comboe specified.
 
 - returns: A parent view controller that represents a device with an orientation and specific traits
 */
public func createParent(
    for child: UIViewController,
    as device: Device,
    _ orientation: Orientation,
    with additionalTraits: UITraitCollection = .init()
) -> UIViewController {

    let parent = UIViewController()
    parent.addChildViewController(child)
    parent.view.addSubview(child.view)
    child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    let traits = createTraitCollection(for: device, orientation)
    
    parent.view.frame = device.bounds(for: orientation)
    child.view.frame = parent.view.frame
    parent.preferredContentSize = parent.view.frame.size
    parent.view.backgroundColor = .white
    
    let allTraits = UITraitCollection.init(traitsFrom: [traits, additionalTraits])
    parent.setOverrideTraitCollection(allTraits, forChildViewController: child)
    
    return parent
}
