//
//  RouteTypes.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a transport mode
public struct RouteType: Codable {

    /// Name of the transport mode
    public let routeTypeName: String?

    /// Identifier for the transport mode
    public let routeType: Int?
}
