//
//  Run.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Individual trips/service of a route
public struct Run: Decodable {

    /// Trip/service run identifier
    public let runId: Int?

    /// Route identifier
    public let routeId: Int?

    /// Transport mode identifier
    public let routeType: Int?

    /// Stop identifier of the final stop on the run
    public let finalStopId: Int?

    /// Name of destination of run
    public let destinationName: String?

    /// Status of metropolitan train run; returns "scheduled" for other modes
    public let status: String?

    /// Direction of travel identifier
    public let directionId: Int?

    /// Chronological sequence of the trip/service run on the route in direction. Order ascendingly by this field to get
    /// chronological order (earliest first) of runs with the same routeId and directionId
    public let runSequence: Int?

    /// The number of remaining skipped/express stations for the run/service from a stop
    public let expressStopCount: Int?

    /// Position of the trip/service run. Only available for some bus runs
    public let vehiclePosition: VehiclePosition?

    /// Descriptor of the trip/service run. Only available for some runs
    public let vehicleDescription: VehicleDescriptor?
}
