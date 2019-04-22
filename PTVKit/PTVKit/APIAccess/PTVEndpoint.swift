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
    case route(routeId: Int)
    case routes
    case routeTypes
    case stopsByLocation(latitude: Double, longitude: Double)
    case stopsOnRoute(routeId: Int, routeType: Int)
    case stop(stopId: Int, routeType: Int)

    var path: String {
        switch self {
        case let .route(routeId): return "/\(version)/routes/\(routeId)"
        case .routes: return "/\(version)/routes"
        case .routeTypes: return "/\(version)/route_types"
        case let .stopsByLocation(latitude, longitude): return "/\(version)/stops/location/\(latitude),\(longitude)"
        case let .stopsOnRoute(routeId, routeType): return "/\(version)/stops/route/\(routeId)/route_type/\(routeType)"
        case let .stop(stopId, routeType): return "/\(version)/stops/\(stopId)/route_type/\(routeType)"
        }
    }
}
