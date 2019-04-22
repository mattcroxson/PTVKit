//
//  PTVAPIAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation
import CommonCrypto

public class PTVAPIAccess {
    let environment: PTVAPIEnvironment

    public init(configuration: PTVAPIConfigurationProvider) {
        self.environment = PTVAPIEnvironment(configuration: configuration)
    }
    
    internal func signedUrl(from url: URL?) -> URL? {
        return url?.signedUrl(environment: environment)
    }
}
