//
//  Departure.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Timetabled and real-time service departures
public struct Departure: Codable {

    /// Stop identifier
    public let stopId: Int?

    /// Route identifier
    public let routeId: Int?

    /// Trip/service run identifier
    public let runId: Int?

    /// Direction of travel identifier
    public let directionId: Int?

    /// Disruption information identifier
    public let disruptionIds: [Int]?

    /// Scheduled (i.e. timetabled) departure time and date in ISO 8601 UTC format
    public let scheduledDepartureUtc: String?

    /// Real-time estimate of departure time and date in ISO 8601 UTC format
    public let estimatedDepartureUtc: String?

    /// Indicates if the metropolitan train service is at the platform at the time of query; returns false for other
    /// modes
    public let atPlatform: Bool?

    /// Platform number at stop (metropolitan train only). Nil for other modes
    public let platformNumber: String?

    /// Flag indicating special condition for run (e.g. RR Reservations Required, GC Guaranteed Connection, DOO Drop Off
    /// Only, PUO Pick Up Only, MO Mondays only, TU Tuesdays only, WE Wednesdays only, TH Thursdays only, FR Fridays
    /// only, SS School days only; ignore E flag)
    public let flags: String?

    /// Chronological sequence of the departure for the run on the route. Order ascendingly by this field to get
    /// chronological order (earliest first) of departures with the same routeId and runId
    public let departureSequence: Int?
}
