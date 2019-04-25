//
//  VehiclePosition.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Vehicle position of a trip/service run
public struct VehiclePosition: Decodable {

    /// Geographic coordinate (latitude)
    public let latitude: Double?

    /// Geographic coordinate (latitude)
    public let longitude: Double?

    /// Compass bearing of the vehicle, clockwise from True North.
    public let bearing: Double?

    /// Supplier of vehicle position data
    public let supplier: String?
}
