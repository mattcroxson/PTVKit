//
//  StopAmenityDetails.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents amenity and facility details at the stop
public struct StopAmenityDetails: Codable {

    /// Indicates if there is a public toilet at or near the stop
    public let toilet: Bool?

    /// Indicates if there is a taxi rank at or near the stop
    public let taxiRank: Bool?

    /// The number of free car parking spots at the stop
    public let carParking: Bool?

    /// Indicates if there are CCTV (i.e. closed circuit television) cameras at the stop
    public let cctv: Bool?
}
