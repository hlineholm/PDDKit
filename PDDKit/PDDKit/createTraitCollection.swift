//
//  createTraitCollection.swift
//  PDDKit
//
//  Created by Lineholm, Henrik on 2017-10-03.
//  Copyright © 2017 FLIR Instruments. All rights reserved.
//

import Foundation
import UIKit


/**
 Creates a trait collection that represents a specific device and orientation.
 
 - parameter device: The device the controller should represent.
 - parameter orientation: The orientation of the device.
 
 - returns: A trait collection that represents a specific device and orientation.
 */
internal func createTraitCollection(for device: Device, _ orientation: Orientation) -> UITraitCollection {

    switch (device, orientation) {
    case (.phone35, .portrait):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.phone35, .landscape):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.phone40, .portrait):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.phone40, .landscape):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.phone47, .portrait):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.phone47, .landscape):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.phone55, .portrait):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.phone55, .landscape):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
        ])
    case (.pad, .portrait):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
        ])
    case (.pad, .landscape):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
        ])
    case (.pad129, .portrait):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
        ])
    case (.pad129, .landscape):
        return .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
        ])
    }
}

public enum Orientation {
    case portrait
    case landscape
}
public enum Device: String {
    case phone35 = "{320,480}"
    case phone40 = "{320,568}"
    case phone47 = "{375,667}"
    case phone55 = "{414,736}"
    case pad = "{768,1024}"
    case pad129 = "{1024,1366}"

    func bounds(for orientation: Orientation) -> CGRect {
        let size = CGSizeFromString(self.rawValue)

        switch orientation {
        case .portrait:
            return CGRect(x: 0, y: 0, width: size.width, height: size.height)
        case .landscape:
            return CGRect(x: 0, y: 0, width: size.height, height: size.width)
        }
    }
}
