//
//  DisruptionRoute.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a route related to a disruption
public struct DisruptionRoute: Codable {

    /// Transport mode identifier
    public let routeType: Int?

    /// Route identifer
    public let routeId: Int?

    /// Name of route
    public let routeName: String?

    /// Route number presented to public (i.e. not route_id)
    public let routeNumber: String?

    /// GTFS Identifer of the route
    public let routeGtfsId: String?

    /// Direction of travel relevant to a disruption (if applicable)
    public let direction: DisruptionDirection?
}
