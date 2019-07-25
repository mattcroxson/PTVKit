//
//  StopDetails.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents details of a stop
public struct StopDetails: Codable {

    /// Array of disruption information identifiers
    public let disruptionIds: [Int]?

    /// Type of metropolitan train station (i.e. "Premium", "Host" or "Unstaffed" station); returns null for V/Line
    /// train
    public let stationType: String?

    /// The definition applicable to the station_type; returns null for V/Line train
    public let stationDescription: String?

    /// Transport mode identifier
    public let routeType: Int?

    /// Location details of the stop
    public let stopLocation: StopLocation?

    /// Amenity and facility details at the stop
    public let stopAmenities: StopAmenityDetails?

    /// Facilities relating to the accessibility of the stop
    public let stopAccessibility: StopAccessibility?

    /// Staffing details for the stop
    public let stopStaffing: StopStaffing?

    /// Stop identifier
    public let stopId: Int?

    /// Name of stop
    public let stopName: String?
}
