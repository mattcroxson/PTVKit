//
//  PTVAPIEnvironment.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

internal class PTVAPIEnvironment {
    let configuration: PTVAPIConfigurationProvider

    init(configuration: PTVAPIConfigurationProvider) {
        self.configuration = configuration
    }
}
