//
//  StopAccessibility.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents facilities relating to the accessibility of the stop
public struct StopAccessibility: Decodable {

    /// Indicates if there is lighting at the stop
    public let lighting: Bool?

    /// Indicates the platform number for xivic information (Platform 0 indicates general stop facilities)
    public let platformNumber: Int?

    /// Indicates if there is at least one audio customer information at the stop/platform
    public let audioCustomerInformation: Bool?

    /// Indicates if there is at least one accessible escalator at the stop/platform
    public let escalator: Bool?

    /// Indicates if there is a hearing loop facility at the stop/platform
    public let hearingLoop: Bool?

    /// Indicates if there is an elevator at the stop/platform
    public let lift: Bool?

    /// Indicates if there are stairs available in the stop
    public let stairs: Bool?

    /// Indicates if the stop is accessible
    public let stopAccessible: Bool?

    /// Indicates if there are tactile tiles (also known as tactile ground surface indicators, or TGSIs) at the stop
    public let tactileGroundServiceIndicator: Bool?

    /// Indicates if there is a general waiting area at the stop
    public let waitingRoom: Bool?

    /// Facilities relating to the accessibility of the stop by wheelchair
    public let wheelchair: StopAccessibilityWheelchair?
}
