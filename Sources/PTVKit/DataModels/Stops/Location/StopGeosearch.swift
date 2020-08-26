//
//  StopGeosearch.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a response to requesting stops by location
public struct StopGeosearch: Codable {

    /// Array of disruption information identifiers
    public let disruptionIds: [Int]?

    /// Distance to stop from input location (in metres), returns 0 if no location input.
    public let stopDistance: Double?

    /// Suburb of the stop
    public let stopSuburb: String?

    /// Name of the stop
    public let stopName: String?

    /// Stop identifier
    public let stopId: Int?

    /// Transport mode identifier
    public let routeType: Int?

    /// Geographic coordinate (latitude)
    public let stopLatitude: Double?

    /// Geographic coordinate (longitude)
    public let stopLongitude: Double?

    /// Sequence of the stop on the route/run
    ///
    /// Returns `0` when routeId and runId not specified in request.
    /// Order this field ascendingly (when non-zero) to get physical order (earliest first) of stops on that route.
    public let stopSequence: Int?
}

// MARK: - Combine Extensions

extension StopGeosearch: Identifiable {
    public var id: Int? { stopId }
}
