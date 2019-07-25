//
//  DisruptionsResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a response to request for disruptions
public struct DisruptionsResponse: Codable {

    /// Disruption information applicable to relevant routes or stops
    public let disruptions: Disruptions?

    /// API system status
    public let status: Status?
}
