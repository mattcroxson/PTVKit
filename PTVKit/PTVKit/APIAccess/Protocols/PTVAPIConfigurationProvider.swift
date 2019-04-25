//
//  PTVAPIConfigurationProvider.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public protocol PTVAPIConfigurationProvider {
    var apiUserId: String { get }
    var apiKey: String { get }
}
