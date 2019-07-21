//
//  PTVEndpointParameterName.swift
//  PTVKit
//
//  Created by Matt Croxson on 27/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Name of query parameters to be passed into the API
public enum PTVEndpointParameterName: String {

    /// Filter by the date and time of the request (ISO 8601 UTC format)
    case dateUtc = "date_utc"

    /// Filter by identifier of direction of travel; values returned by Directions API.
    case directionId = "direction_id"

    /// Filter by `dirsuptionMode`; values returned via Disruption Modes API
    case disruptionModes = "disruption_modes"

    /// Filter by status of disruption
    case disruptionStatus = "disruption_status"

    /// List objects to be returned in full (i.e. expanded) - options include: all, stop, route, run, direction,
    /// disruption
    case expand

    /// Incdicates whether the `stopId` is a GTFS ID or not
    case gtfs

    /// Placeholder for future development; currently unavailable
    case includeAddresses = "include_addresses"

    /// Indicates if cancelled services (if they exist) are returned (default = false) - metropolitan train only
    case includeCancelled = "include_cancelled"

    /// Indicates if outlets will be returned in response (default = true)
    case includeOutlets = "include_outlets"

    /// Geographic coordinate of latitude
    case latitude

    /// Geographic coordinate of longitude
    case longitude

    /// Indicates if filtering runs (and their departures) to those that arrive at destination before `dateUtc`
    /// (default = false). Requires `maxResults` > 0.
    case lookBackwards = "look_backwards"

    /// Indicates whether to find routes by suburbs in the search term (default = true)
    case matchRouteBySuburb = "match_route_by_suburb"

    /// Indicates whether to search for stops according to a metlink stop ID (default = false)
    case matchStopByGtfsStopId = "match_stop_by_gtfs_stop_id"

    /// Indicates whether to find stops by suburbs in the search term (default = true)
    case matchStopBySuburb = "match_stop_by_suburb"

    /// Filter by maximum distance (in metres) from location specified via latitude and longitude parameters
    /// (default = 300)
    case maxDistance = "max_distance"

    /// Maximum number of results returned
    case maxResults = "max_results"

    /// Filter by platform number at stop.
    case platformNumbers = "platform_numbers"

    /// Filter by name of route (accepts partial route name matches)
    case routeName = "route_name"

    /// Filter by `routeType`; values returned via RouteTypes API
    case routeType = "route_type"

    /// Filter by `routeType`; values returned via RouteTypes API
    case routeTypes = "route_types"

    /// Filter by `stopId`; values returned by Stops API
    case stopId = "stop_id"

    /// Indicates if stop accessibility information will be returned (default = false)
    case stopAccessibility = "stop_accessibility"

    /// Indicates if stop amenity information will be returned (default = false)
    case stopAmenities = "stop_amenities"

    /// Placeholder for future development; currently unavailable
    case stopContact = "stop_contact"

    /// Indicates if stop disruption information will be returned (default = false)
    case stopDisruptions = "stop_disruptions"

    /// Indicates if stop location information will be returned (default = false)
    case stopLocation = "stop_location"

    /// Indicates if stop staffing information will be returned (default = false)
    case stopStaffing = "stop_staffing"

    /// Placeholder for future development; currently unavailable
    case stopTicket = "stop_ticket"
}
