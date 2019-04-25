//
//  PTVAPIParameters.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public struct PTVAPIParameters {

    private let name: PTVAPIParameterName
    private let values: [CustomStringConvertible]

    public init(name: PTVAPIParameterName, value: CustomStringConvertible) {
        self.name = name
        self.values = [value]
    }

    public init(name: PTVAPIParameterName, values: [CustomStringConvertible]) {
        self.name = name
        self.values = values
    }

    internal var urlQueryItems: [URLQueryItem] {
        return values.map { URLQueryItem(name: name.rawValue, value: $0.description ) }
    }
}

public enum PTVAPIParameterName: String {
    case dateUtc = "date_utc"
    case directionId = "direction_id"
    case disruptionModes = "disruption_modes"
    case disruptionStatus = "disruption_status"
    case expand
    case gtfs
    case includeAddresses = "include_addresses"
    case includeCancelled = "include_cancelled"
    case includeOutlets = "include_outlets"
    case latitude
    case longitude
    case lookBackwards = "look_backwards"
    case matchRouteBySuburb = "match_route_by_suburb"
    case matchStopByGtfsStopId = "match_stop_by_gtfs_stop_id"
    case matchStopBySuburb = "match_stop_by_suburb"
    case maxDistance = "max_distance"
    case maxResults = "max_results"
    case platformNumbers = "platform_numbers"
    case routeId = "route_id"
    case routeName = "route_name"
    case routeType = "route_type"
    case routeTypes = "route_types"
    case runId = "run_id"
    case searchTerm = "search_term"
    case stopId = "stop_id"
    case stopAccessibility = "stop_accessibility"
    case stopAmenities = "stop_amenities"
    case stopContact = "stop_contact"
    case stopDisruptions = "stop_disruptions"
    case stopLocation = "stop_location"
    case stopStaffing = "stop_staffing"
    case stopTicket = "stop_ticket"
}
