//
//  Direction.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a direction of travel on a route
public struct Direction: Codable {

    /// Direction of travel identifier
    public let directionId: Int?

    /// Name of direction of travel
    public let directionName: String?

    /// Route identifier
    public let routeId: Int?

    /// Transport mode identifier
    public let routeType: Int?
}
