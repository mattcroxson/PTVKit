//
//  Disruptions.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Disruption information applicable to relevant routes or stops
public struct Disruptions: Decodable {

    /// Subset of disruption information applicable to multiple route types
    public let general: [Disruption]?

    /// Subset of disruption information applicable to metropolitan train
    public let metroTrain: [Disruption]?

    /// Subset of disruption information applicable to metropolitan tram
    public let metroTram: [Disruption]?

    /// Subset of disruption information applicable to metropolitan bus
    public let metroBus: [Disruption]?

    /// Subset of disruption information applicable to V/Line train
    public let regionalTrain: [Disruption]?

    /// Subset of disruption information applicable to V/Line coach
    public let regionalCoach: [Disruption]?

    /// Subset of disruption information applicable to regional bus
    public let regionalBus: [Disruption]?

    /// Subset of disruption information applicable to school bus
    public let schoolBus: [Disruption]?

    /// Subset of disruption information applicable to telebus service
    public let telebus: [Disruption]?

    /// Subset of disruption information applicable to night bus
    public let nightBus: [Disruption]?

    /// Subset of disruption information applicable to ferry
    public let ferry: [Disruption]?

    /// Subset of disruption information applicable to interstate train
    public let interstateTrain: [Disruption]?

    /// Subset of disruption information applicable to skybus
    public let skybus: [Disruption]?

    /// Subset of disruption information applicable to taxi
    public let taxi: [Disruption]?
}
