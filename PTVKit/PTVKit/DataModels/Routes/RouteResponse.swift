//
//  RouteResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a response to request for routes
public struct RouteResponse: Decodable {

    /// Single route if only 1 is available
    public let route: Route?

    /// Array of routes
    public let routes: [Route]?

    /// API system status
    public let status: Status?
}
