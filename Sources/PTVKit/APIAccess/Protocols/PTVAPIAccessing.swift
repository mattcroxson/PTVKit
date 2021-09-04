//
//  PTVAPIAccessing.swift
//  PTVKit
//
//  Created by Matt Croxson on 27/8/20.
//  Copyright © 2020 Matt Croxson. All rights reserved.
//

import Combine
import Foundation

/// PTV API interface
public protocol PTVAPIAccessing {

    // MARK: - Completion Handler

    /// Completion handler called when a URL request either receives a response or throws an error
    typealias ResponseCompletion<T: Decodable> = (Result<T, PTVAPIError>) -> Void

    /// Performs an API request and calls the completion handler once a response is received or an error is thrown.
    ///
    /// - Parameters:
    ///   - endpoint: Endpoint to retrieve data from
    ///   - parameters: Parameters to include in the request
    ///   - completion: Completion handler to call when the request completes or an error is thrown
    func getResponse<T: Decodable>(from endpoint: PTVEndpoint,
                                   parameters: [PTVEndpointParameter]?,
                                   completion: ResponseCompletion<T>?)

    // MARK: - Combine/SwiftUI

    /// Publisher that performs an API request and emits the response, or an error if one is thrown
    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    typealias APIPublisher<T: Decodable> = AnyPublisher<T, PTVAPIError>

    // MARK: - Async/Await

    /// Returns a publisher that performs an API request and emits the response, or an error if one is thrown
    ///
    /// - Parameters:
    ///   - endpoint: Endpoint to retreive data from
    ///   - parameters: Parameters to include in the request
    /// - Returns: `AnyPublisher` object that emits once the request completes or if an error is thrown.
    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func apiResponsePublisher<T: Decodable>(for endpoint: PTVEndpoint,
                                            parameters: [PTVEndpointParameter]?) -> APIPublisher<T>
}
