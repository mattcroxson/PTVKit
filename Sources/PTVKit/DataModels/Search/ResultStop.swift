//
//  ResultStop.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Train stations, tram stops, bus stops, regional coach stops or Night Bus stops
public struct ResultStop: Codable {

    /// Distance of stop from input location (in metres); returns 0 if no location is input
    public let stopDistance: Double?

    /// Suburb of stop
    public let stopSuburb: String?

    /// Name of stop
    public let stopName: String?

    /// Stop identifier
    public let stopId: Int?

    /// Transport mode identifier
    public let routeType: Int?

    /// Geographic coordinate (latitude)
    public let stopLatitude: Double?

    /// Geographic coordinate (longitude)
    public let stopLongitude: Double?

    /// Sequence of the stop on the route/run; return 0 when routeId or runId not specified. Order ascendingly by this
    /// field (when non zero) to get physical order (earliest first) of stops on the routeId/runId
    public let stopSequence: Int?
}

// MARK: - Combine Extensions

extension ResultStop: Identifiable {
    public var id: Int? { stopId }
}
