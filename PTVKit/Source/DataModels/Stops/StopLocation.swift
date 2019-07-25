//
//  StopLocation.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents the location of a stop
public struct StopLocation: Codable {

    /// GPS coordinates of the stop
    public let gps: StopGPS?
}
