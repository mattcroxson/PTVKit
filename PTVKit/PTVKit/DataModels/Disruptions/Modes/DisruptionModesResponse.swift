//
//  DisruptionModesResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents the response to a disruption modes request
public struct DisruptionModesResponse: Decodable {

    /// An array of transport mode identifiers
    public let disruptionModes: [DisruptionMode]?

    /// API systme status
    public let status: Status?
}
