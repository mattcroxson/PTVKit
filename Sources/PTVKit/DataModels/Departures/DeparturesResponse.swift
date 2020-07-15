//
//  DeparturesResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a request for departures
public struct DeparturesResponse: Codable {

    /// Timetabled and real-time service departures
    public let departures: [Departure]?

    /// A train station, tram stop, bus stop, regional coach stop or Night Bus stop
    public let stops: [Int: ResultStop]?

    /// Train lines, tram routes, bus routes, regional coach routes, Night Bus routes
    public let routes: [Int: Route]?

    /// Individual trips/services of a route
    public let runs: [Int: Run]?

    /// Directions of travel of route
    public let directions: [Int: Direction]?

    /// Disruption information applicable to relevant routes or stops
    public let disruptions: [Int: Disruption]?

    /// API system status
    public let status: Status?
}
