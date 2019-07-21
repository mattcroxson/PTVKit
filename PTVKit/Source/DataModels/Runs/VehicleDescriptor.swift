//
//  VehicleDescriptor.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Vehicle descriptor of a trip/service run
public struct VehicleDescriptor: Decodable {

    /// Operator name of the vehicle. Only available for train, tram, v/line and some bus runs
    public let `operator`: String?

    /// Operator identifier of the vehicle. Only available for some tram and bus runs.
    public let identifier: String?

    /// Indicator if vehicle has a low floor. Only available for some tram runs
    public let lowFloor: Bool?

    /// Indicator if vehicle is air conditioned. Only available for some tram runs
    public let airConditioned: Bool?

    /// Vehicle description. Only available for some metropolitan train runs
    public let description: String?

    /// Supplier of vehicle descriptor data
    public let supplier: String?

    private enum CodingKeys: String, CodingKey {
        case `operator`, identifier = "id", lowFloor, airConditioned, description, supplier
    }
}
