//
//  DisruptionMode.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a transport mode for a disruption
public struct DisruptionMode: Decodable {

    /// Name of disruption mode
    public let disruptionModeName: String?

    /// Disruption mode identifier
    public let disruptionMode: Int?
}
