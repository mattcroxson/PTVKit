//
//  Disruption.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents disruption information
public struct Disruption: Codable {

    /// Disruption information identifier
    public let disruptionId: Int?

    /// Headline title summarising disruption information
    public let title: String?

    /// URL of relevant article on PTV website
    public let url: String?

    /// Description of the disruption
    public let description: String?

    /// Status of the disruption (e.g. "Planned", "Current")
    public let disruptionStatus: String?

    /// Type of disruption
    public let disruptionType: String?

    /// Date and time disruption information is published on PTV website, in ISO 8601 UTC format
    public let publishedOn: String?

    /// Date and time disruption information was last updated by PTV, in ISO 8601 UTC format
    public let lastUpdated: String?

    /// Date and time at which disruption begins, in ISO 8601 UTC format
    public let fromDate: String?

    /// Date and time at which disruption ends, in ISO 8601 UTC format, or nil if unknown
    public let toDate: String?

    /// Route relevant to a disruption (if applicable)
    public let routes: [DisruptionRoute]?

    /// Stop relevant to a disruption (if applicable)
    public let stops: [DisruptionStop]?

    /// Currently unknown usage.
    public let colour: String?

    /// Currently unknown usage.
    public let displayOnBoard: Bool?

    /// Currently unknown usage.
    public let displayStatus: Bool?
}

extension Disruption: Identifiable {
    public var id: Int? { disruptionId }
}
