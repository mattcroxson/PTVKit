//
//  DisruptionStop.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents a stop related to a disruption
public struct DisruptionStop: Codable {

    /// Stop identifier
    public let stopId: Int?

    /// Name of stop
    public let stopName: String?
}

// MARK: - Combine Extensions

extension DisruptionStop: Identifiable {
    public var id: Int? { stopId }
}
