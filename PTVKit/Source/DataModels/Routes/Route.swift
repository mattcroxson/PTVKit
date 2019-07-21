//
//  Route.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a route
public struct Route: Decodable {

    /// Transport mode identifier
    public let routeType: Int?

    /// Route identifier
    public let routeId: Int?

    /// Name of route
    public let routeName: String?

    /// Route number represented to the public
    public let routeNumber: String?

    /// GTFS identifier of the route
    public let routeGtfsId: String?
}
