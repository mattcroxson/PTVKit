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
    case disruptions
    case disruptionsByRoute(routeId: Int)
    case disruptionsByRouteAndStop(routeId: Int, stopId: Int)
    case disruptionsByStop(stopId: Int)
    case disruption(disruptionId: Int)
    case disruptionModes

    var path: String {
        switch self {

        // MARK: Routes
        case let .route(routeId): return "/\(version)/routes/\(routeId)"
        case .routes: return "/\(version)/routes"
        case .routeTypes: return "/\(version)/route_types"

        // MARK: Stops
        case let .stopsByLocation(latitude, longitude): return "/\(version)/stops/location/\(latitude),\(longitude)"
        case let .stopsOnRoute(routeId, routeType): return "/\(version)/stops/route/\(routeId)/route_type/\(routeType)"
        case let .stop(stopId, routeType): return "/\(version)/stops/\(stopId)/route_type/\(routeType)"

        // MARK: Disruptions
        case .disruptions: return "/\(version)/disruptions/"
        case let .disruptionsByRoute(routeId): return "/\(version)/disruptions/route/\(routeId)"
        case let .disruptionsByRouteAndStop(routeId, stopId): return "/\(version)/disruptions/route/\(routeId)/stop/\(stopId)"
        case let .disruptionsByStop(stopId): return "/\(version)/disruptions/stop/\(stopId)"
        case let .disruption(disruptionId): return   "/\(version)/disruptions/\(disruptionId)"
        case .disruptionModes: return "/\(version)/disruptions/modes"
        }
    }
}
