//
//  PTVEndpoint.swift
//  PTVKit
//
//  Created by Matt Croxson on 22/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

internal enum PTVEndpoint: PTVEndpointConfigurer {

    // Endpoints
    case route(routeId: String)
    case routes
    case routeTypes
    case stopsByLocation(latitude: Double, longitude: Double)

    var path: String {
        switch self {
        case let .route(routeId): return "/\(version)/routes/\(routeId)"
        case .routes: return "/\(version)/routes"
        case .routeTypes: return "/\(version)/route_types"
        case let .stopsByLocation(latitude, longitude): return "/\(version)/stops/location/\(latitude),\(longitude)"
        }
    }
}
