//
//  StopGPS.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents geographic coordinates for a stop
public struct StopGPS: Decodable {

    /// Geographic coordinate (latitude)
    public let latitude: Double?

    /// Geographic coordinate (longitude)
    public let longitude: Double?
}
