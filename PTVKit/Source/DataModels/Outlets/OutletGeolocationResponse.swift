//
//  OutletGeolocationResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Reprents a response to a myki ticket outlet geolocation request
public struct OutletGeolocationResponse: Decodable {

    /// Myki ticket outlets
    public let outlets: [OutletGeolocation]?

    /// API system status
    public let status: Status?
}
