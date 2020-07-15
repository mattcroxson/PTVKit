//
//  DirectionsResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents the response to a directions request
public struct DirectionsResponse: Codable {

    /// Directions of travel of route
    public let directions: [Direction]?

    /// API system status
    public let status: Status?
}
