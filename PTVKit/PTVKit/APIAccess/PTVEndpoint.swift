//
//  PTVEndpoint.swift
//  PTVKit
//
//  Created by Matt Croxson on 22/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// PTV timetable API endpoints
internal enum PTVEndpoint {

    /// Get route name and number for specific route ID
    case route(routeId: Int)

    /// List route names and numbers for all routes
    case routes

    /// List all route types and their names
    case routeTypes

    /// View all stops near a specific location
    case stopsByLocation(latitude: Double, longitude: Double)

    /// View all stops on a specific route
    case stopsOnRoute(routeId: Int, routeType: Int)

    /// View facilities at a specific stop (Metro and V/Line stations only)
    case stop(stopId: Int, routeType: Int)

    /// List all disruptions for all route types
    case disruptions

    /// List all disruptions for a particular route
    case disruptionsByRoute(routeId: Int)

    /// List all disruptions for a particular route and stop
    case disruptionsByRouteAndStop(routeId: Int, stopId: Int)

    /// List all disruptions for a particular stop
    case disruptionsByStop(stopId: Int)

    /// Retrieve a specific disruption
    case disruption(disruptionId: Int)

    /// List all disruption modes
    case disruptionModes

    /// List departures for all routes from a stop
    case departuresByRouteTypeAndStop(routeType: Int, stopId: Int)

    /// List departures for a specific route from a stop
    case departuresByRouteTypeStopAndRoute(routeType: Int, stopId: Int, routeId: Int)

    /// List directions that a route travels in
    case directionsByRoute(routeId: Int)

    /// List all routes for a direction of travel
    case directions(directionId: Int)

    /// List all routes of a particular type for a direction of travel
    case directionsByRouteType(directionId: Int, routeType: Int)

    /// List all ticket outlets
    case outlets

    /// List ticket outlets near a specific location
    case outletsByLocation(latitude: Double, longitude: Double)

    /// Get the stopping pattern for a specific trip/service run
    case stoppingPatternByRunAndRouteType(runId: Int, routeType: Int)

    /// List all trip/service runs for a specific route ID
    case runsOnRoute(routeId: Int)

    /// List all trip/service runs for a specific route ID and route type
    case runsOnRouteByType(routeId: Int, routeType: Int)

    /// View all trip/service runs for a specific run ID
    case runs(runId: Int)

    /// View the trip/service run for a specific run ID and route type
    case runsByRouteType(runId: Int, routeType: Int)

    /// View stops, routes and myki ticket outlets that match the search term
    case search(searchTerm: String)
}

extension PTVEndpoint: PTVEndpointConfigurer {

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

        // MARK: Departures

        case let .departuresByRouteTypeAndStop(routeType, stopId): return "/\(version)/departures/route_type/\(routeType)/stop/\(stopId)"
        case let .departuresByRouteTypeStopAndRoute(routeType, stopId, routeId): return "/\(version)/departures/route_type/\(routeType)/stop/\(stopId)/route/\(routeId)"

        // MARK: Directions
            
        case let .directions(directionId): return "/\(version)/directions/\(directionId)"
        case let .directionsByRoute(routeId): return "/\(version)/directions/route/\(routeId)"
        case let .directionsByRouteType(directionId, routeType): return "/\(version)/directions/\(directionId)/route_type/\(routeType)"

        // MARK: Outlets

        case .outlets: return "/\(version)/outlets"
        case let .outletsByLocation(latitude, longitude): return "/\(version)/outlets/\(latitude),\(longitude)"

        // MARK: Stopping Pattern

        case let .stoppingPatternByRunAndRouteType(runId, routeType): return "/\(version)/pattern/run/\(runId)/route_type/\(routeType)"

        // MARK: Runs

        case let .runsOnRoute(routeId): return "/\(version)/runs/route/\(routeId)"
        case let .runsOnRouteByType(routeId, routeType): return "/\(version)/runs/route/\(routeId)/route_type/\(routeType)"
        case let .runs(runId): return "/\(version)/runs/\(runId)"
        case let .runsByRouteType(runId, routeType): return "/\(version)/runs/\(runId)/route_type/\(routeType)"

        // MARK: Search
            
        case let .search(searchTerm): return "/\(version)/search/\(searchTerm)"

        }
    }
}
