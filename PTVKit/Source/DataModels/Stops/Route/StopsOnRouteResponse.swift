//
//  StopsOnRouteResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a response to a stops on route request
public struct StopsOnRouteResponse: Decodable {

    /// Array of stops
    public let stops: [StopOnRoute]?

    /// Array of disruption objects
//    public let disruptions: [Any]?

    /// API system status
    public let status: Status?
}