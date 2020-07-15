//
//  PTVAPIConfigurationProvider.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Provides required configuration information for the PTV API access object.
public protocol PTVAPIConfigurationProvider {

    /// API User ID, provided by PTV
    var apiUserId: String { get }

    /// API Key, provided by PTV
    var apiKey: String { get }
}
