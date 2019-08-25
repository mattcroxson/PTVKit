//
//  DisruptionResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/8/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Disruption information for the specified disruption ID
public struct DisruptionResponse: Codable {

    /// Disruption information applicable to relevant routes or stops
    public let disruption: Disruption?

    /// API system status
    public let status: Status?
}
