//
//  PTVAPIError.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Errors that can be thrown by the PTV API
public enum PTVAPIError: LocalizedError {

    /// The API returned an HTTP 403 `access denied` error
    case accessDenied

    /// An error that occurs generating the API URL request
    case cannotGenerateRequest

    /// An error that occurs when an API call is requested with an endpoint that does not match the expected result
    /// response type
    case incompatibleEndpoint(response: Decodable.Type, endpoint: Decodable.Type)

    /// The API returned an HTTP 400 `invalid request` error
    case invalidRequest

    /// The response returned by the API is not valid
    case invalidResponse

    /// The endpoint is missing a response type
    case missingResponseType(endpoint: PTVEndpoint)

    /// An error that occurs while the request is being performed, including a description
    case requestFailed(baseError: Error)

    /// The API returned an unexpected HTTP status code.
    case unexpectedStatus(Int)

    /// An unknown error has occurred
    case unknown

    /// Localized description of the error that has occured
    public var errorDescription: String? {
        switch self {
        case .accessDenied: return "API authencation failed. Check your credentials are correct. (HTTP 403)"
        case .cannotGenerateRequest: return "An error occurred generating the URL request"
        case let .incompatibleEndpoint(response, endpoint):
            return "The API response \(response) selected does not match the endpoint response \(endpoint)"
        case .invalidRequest: return "The request was invalid. Check the configuration is correct. (HTTP 400)"
        case .invalidResponse: return "An unexpected response was returned by the API."
        case let .missingResponseType(endpoint): return "The endpoint \(endpoint) is missing a response type."
        case let .requestFailed(baseError): return baseError.localizedDescription
        case let .unexpectedStatus(statusCode): return "The API returned an unexpected response: (HTTP \(statusCode))"
        case .unknown: return "An unknown error has occurred"
        }
    }

    static func map(_ error: Error) -> PTVAPIError {
        return error as? PTVAPIError ?? .requestFailed(baseError: error)
    }
}
