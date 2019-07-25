//
//  StoppingPattern.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// The stopping pattern of the specified trip/service run and route type
public struct StoppingPattern: Codable {

    /// Disruption information applicable to relevant routes or stops
    public let disruptions: [Disruption]?

    /// Timetabled and real-time service departures
    public let departures: [Departure]?

//    /// A train station, tram stop, bus stop, regional coach stop or Night Bus stop
//    public let stops: Any?

//    /// Train lines, tram routes, bus routes, regional coach routes, Night Bus routes
//    public let routes: Any?

//    /// Individual trips/services of a route
//    public let runs: Any?

//    /// Directions of travel of route
//    public let directions: Any?

    /// API system status
    public let status: Status
}
