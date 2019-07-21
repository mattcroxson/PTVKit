//
//  RunsResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a response to a request for trip/service run details.
public struct RunsResponse: Decodable {

    /// Individual trips/services of a route
    public let runs: [Run]?

    /// API system status
    public let status: Status?
}
