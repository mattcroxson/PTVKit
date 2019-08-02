//
//  PTVAPIError.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Errors that can be thrown by the PTV API
public enum PTVAPIError: Swift.Error {

    /// An error that occurs generating the API URL request
    case cannotGenerateRequest

    /// An error that occurs while the request is being performed, including a description
    case requestFailed(baseError: Error)

    /// An error that occurs when an API call is requested with an endpoint that does not match the expected result
    /// response type
    case incompatibleEndpoint(response: Decodable.Type, endpoint: Decodable.Type)

    /// An unknown error has occurred
    case unknown

    /// Localized description of the error that has occured
    public var localizedDescription: String {
        switch self {
        case .cannotGenerateRequest: return "An error occurred generating the URL request"
        case let .requestFailed(baseError): return baseError.localizedDescription
        case let .incompatibleEndpoint(response, endpoint):
            return "The API response \(response) selected does not match the endpoint response \(endpoint)"
        case .unknown: return "An unknown error has occurre"
        }
    }
}
