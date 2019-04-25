//
//  DisruptionDirection.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a direction of travel relevant to a disruption
public struct DisruptionDirection: Decodable {

    /// Route and direction of travel combination identifier
    public let routeDirectionId: Int?

    /// Direction of travel identifier
    public let directionId: Int?

    /// Name of direction of travel
    public let directionName: String?

    /// Time of service to which disruption applies, in 24 hour clock format (HH:MM:SS) AEDT/AEST, or nil if disruption applies to multiple (or no) services
    public let serviceTime: String?
}
