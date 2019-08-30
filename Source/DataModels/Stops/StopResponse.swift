//
//  StopResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents the response to a stop detail request
public struct StopResponse: Codable {

    /// Represents a metropolitan or V/Line train station
    public let stop: StopDetails?

    /// Disruption information applicable to relevant routes or stops
    public let disruptions: [Int: Disruption]?

    /// API system status
    public let status: Status?
}
