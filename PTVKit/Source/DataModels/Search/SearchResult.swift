//
//  SearchResult.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Stops, routes and myki ticket outlets that contain the search term
public struct SearchResult: Codable {

    /// Train stations, tram stops, bus stops, regional coach stops or Night Bus stops
    public let stops: [ResultStop]?

    /// Train lines, tram routes, bus routes, regional coach routes, Night Bus routes
    public let routes: [ResultRoute]?

    /// myki ticket outlets
    public let outlets: [ResultOutlet]?

    /// API system status
    public let status: Status?
}
