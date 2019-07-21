//
//  StopAccessibilityWheelchair.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents facilities relating to the accessibility of the stop by wheelchair
public struct StopAccessibilityWheelchair: Decodable {

    /// Has accessible ramp
    public let accessibleRamp: Bool?

    /// Indicates if there is at least one accessible parking spot at the stop
    public let parking: Bool?

    /// Indicates if there is at least one accessible telephone at the stop/platform
    public let telephone: Bool?

    /// Indicates if there is at least one accessible toilet at the stop/platform
    public let toilet: Bool?

    /// Indicates if there is at least one low ticket counter at the stop
    public let lowTicketCounter: Bool?

    /// Indicates if there is a space for mobility device to board on or off a transport mode
    public let manouvering: Bool?

    /// Indicates if there is a raised platform to board a train
    public let raisedPlatform: Bool?

    /// Indicates if there are ramps (<1:14) at the stop/platform
    public let ramp: Bool?

    /// Indicates if there is a path beyond the stop which is accessible
    public let secondaryPath: Bool?

    /// Indicates if there is shelter near the raised platform
    public let raisedPlatformShelter: Bool?

    /// Indicates if there are ramps (>1:14) at the stop/platform
    public let steepRamp: Bool?

    private enum CodingKeys: String, CodingKey {
        case accessibleRamp
        case parking
        case telephone
        case toilet
        case lowTicketCounter
        case manouvering
        case raisedPlatform
        case ramp
        case secondaryPath
        case raisedPlatformShelter = "raisedPlatformShelther"
        case steepRamp
    }

    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        accessibleRamp = try keyedContainer.decodeIfPresent(Bool.self, forKey: .accessibleRamp)
        parking = try keyedContainer.decodeIfPresent(Bool.self, forKey: .parking)
        telephone = try keyedContainer.decodeIfPresent(Bool.self, forKey: .telephone)
        toilet = try keyedContainer.decodeIfPresent(Bool.self, forKey: .toilet)
        lowTicketCounter = try keyedContainer.decodeIfPresent(Bool.self, forKey: .lowTicketCounter)
        manouvering = try keyedContainer.decodeIfPresent(Bool.self, forKey: .manouvering)
        raisedPlatform = try keyedContainer.decodeIfPresent(Bool.self, forKey: .raisedPlatform)
        ramp = try keyedContainer.decodeIfPresent(Bool.self, forKey: .ramp)
        secondaryPath = try keyedContainer.decodeIfPresent(Bool.self, forKey: .secondaryPath)
        raisedPlatformShelter = try keyedContainer.decodeIfPresent(Bool.self, forKey: .raisedPlatformShelter)
        steepRamp = try keyedContainer.decodeIfPresent(Bool.self, forKey: .steepRamp)
    }
}
