//
//  RouteTypesResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a response to a route types request
public struct RouteTypesResponse: Decodable {

    /// Array of route type identifiers
    public let routeTypes: [RouteType]?

    /// API system status
    public let status: Status?
}
