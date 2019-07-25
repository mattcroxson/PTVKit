//
//  Status.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// API system health status
public struct Status: Codable {

    /// API version number
    public let version: String?

    /// API system health
    ///
    /// The API will return one of the two below possible responses:
    /// - `0` = offline
    /// - `1` = online
    public let health: Int?
}
