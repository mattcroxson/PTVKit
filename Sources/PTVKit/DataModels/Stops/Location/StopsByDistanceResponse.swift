//
//  StopsByDistanceResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a response to a stops by distance request
public struct StopsByDistanceResponse: Codable {

    /// Array of stops
    public let stops: [StopGeosearch]?

    /// Disruption information applicable to relevant routes or stops
    public let disruptions: [Int: Disruption]?

    /// API system status
    public let status: Status?
}
