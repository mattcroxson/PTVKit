//
//  PTVAPIError.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Errors that can be thrown by the PTV API
enum PTVAPIError: Swift.Error {

    /// An error that occurs generating the API URL request
    case cannotGenerateRequest

    /// An error that occurs while the request is being performed, including a description
    case requestFailed(localisedDescription: String)
}
