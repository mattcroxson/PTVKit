//
//  PTVAPIEnvironment.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

class PTVAPIEnvironment {
    let configuration: PTVAPIConfigurationProvider
    let requestTimeout: Double = 30.0
    let resourceTimeout: Double = 30.0

    init(configuration: PTVAPIConfigurationProvider) {
        self.configuration = configuration
    }
}
