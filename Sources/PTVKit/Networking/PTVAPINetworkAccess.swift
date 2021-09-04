//
//  PTVAPINetworkAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 6/10/20.
//  Copyright © 2020 Matt Croxson. All rights reserved.
//

import Foundation
import Combine

// MARK: - Completion Handler

class PTVAPINetworkAccess: NetworkAccess {

    private let environment: PTVAPIEnvironment

    /// Initialises the PTV API network service object
    ///
    /// - Parameters:
    ///   - configuration: Configuration provider to initialise the object
    public init(configuration: PTVAPIConfigurationProvider) {
        self.environment = PTVAPIEnvironment(configuration: configuration)
    }

    /// Performs a URLSessionDataTask using the provided request with the results provided to the completion handler
    /// - Parameters:
    ///   - request: Request to perform with the data task
    ///   - completion: Completion to handle the results of the data task.
    func process(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = environment.requestTimeout
        sessionConfiguration.timeoutIntervalForResource = environment.resourceTimeout
        sessionConfiguration.waitsForConnectivity = true

        let urlSession = URLSession(configuration: sessionConfiguration)

        urlSession
            .dataTask(
                with: request,
                completionHandler: completion
            )
            .resume()
    }
}

// MARK: - Combine/SwiftUI

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension PTVAPINetworkAccess {

    /// Creates a Publisher for the provided data request
    /// - Parameter request: Request to create the publisher with
    /// - Returns: The created publisher
    func publisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = environment.requestTimeout
        sessionConfiguration.timeoutIntervalForResource = environment.resourceTimeout
        sessionConfiguration.waitsForConnectivity = true

        let urlSession = URLSession(configuration: sessionConfiguration)

        return urlSession.dataTaskPublisher(for: request)
    }

    func publisher(for request: URLRequest) -> DataTaskPublisher {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = environment.requestTimeout
        sessionConfiguration.timeoutIntervalForResource = environment.resourceTimeout
        sessionConfiguration.waitsForConnectivity = true

        let urlSession = URLSession(configuration: sessionConfiguration)

        return urlSession
            .dataTaskPublisher(for: request)
            .tryMap { response in
                guard let httpUrlResponse = response.response as? HTTPURLResponse else {
                    throw PTVAPIError.invalidResponse
                }

                let statusCode = httpUrlResponse.statusCode

                guard statusCode == 200 else {
                    switch statusCode {
                    case 400: throw PTVAPIError.invalidRequest
                    case 403: throw PTVAPIError.accessDenied
                    default: throw PTVAPIError.unexpectedStatus(statusCode)
                    }
                }

                return response.data }
            .eraseToAnyPublisher()
    }
}

// MARK: - Async/Await

@available(OSX 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension PTVAPINetworkAccess {
    func process(request: URLRequest) async throws -> Data {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = environment.requestTimeout
        sessionConfiguration.timeoutIntervalForResource = environment.resourceTimeout
        sessionConfiguration.waitsForConnectivity = true

        let urlSession = URLSession(configuration: sessionConfiguration)
        let (data, response) = try await urlSession.data(for: request, delegate: nil)

        guard let httpUrlResponse = response as? HTTPURLResponse else {
            throw PTVAPIError.invalidResponse
        }

        let statusCode = httpUrlResponse.statusCode

        guard statusCode == 200 else {
            switch statusCode {
            case 400: throw PTVAPIError.invalidRequest
            case 403: throw PTVAPIError.accessDenied
            default: throw PTVAPIError.unexpectedStatus(statusCode)
            }
        }

        return data
    }
}
