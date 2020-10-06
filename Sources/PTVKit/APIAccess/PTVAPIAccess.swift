//
//  PTVAPIAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Combine
import Foundation

/// Provides access to the PTV API
public class PTVAPIAccess: PTVAPIAccessing {

    // MARK: - Properties

    private let environment: PTVAPIEnvironment
    private let networkService: NetworkAccess

    // MARK: - PTVAPIAccess

    /// Initialises the PTV API access object with the default network service
    ///
    /// - Parameters:
    ///   - configuration: Configuration provider to initialise the access object
    public convenience init(configuration: PTVAPIConfigurationProvider) {
        let networkService = PTVAPINetworkAccess(configuration: configuration)
        self.init(configuration: configuration, networkService: networkService)
    }

    /// Initialises the PTV API access object
    ///
    /// - Parameters:
    ///   - configuration: Configuration provider to initialise the access object
    ///   - networkService: Network service to process API request through.
    init(configuration: PTVAPIConfigurationProvider,
         networkService: NetworkAccess) {
        self.environment = PTVAPIEnvironment(configuration: configuration)
        self.networkService = networkService
    }

    /// Performs an API request and calls the completion handler once a response is received or an error is thrown.
    ///
    /// - Parameters:
    ///   - endpoint: Endpoint to retrieve data from
    ///   - parameters: Parameters to include in the request
    ///   - completion: Completion handler to call when the request completes or an error is thrown
    public func getResponse<T: Decodable>(from endpoint: PTVEndpoint,
                                          parameters: [PTVEndpointParameter]? = nil,
                                          completion: ResponseCompletion<T>?) {

        guard let responseType = endpoint.responseType else {
            completion?(.failure(.missingResponseType(endpoint: endpoint)))
            return
        }

        guard T.self == endpoint.responseType else {
            completion?(.failure(PTVAPIError.incompatibleEndpoint(response: T.self,
                                                                  endpoint: responseType)))
            return
        }

        let parameterQueryItems = parameters?.flatMap { $0.urlQueryItems }

        guard let request = apiRequest(endpoint: endpoint, parameters: parameterQueryItems) else {
            completion?(.failure(PTVAPIError.cannotGenerateRequest))
            return
        }

        networkService.process(request: request) { (data, response, error) in
            do {
                guard let data = data,
                      let response = response as? HTTPURLResponse,
                      (200..<300) ~= response.statusCode,
                      error == nil else {
                    throw error ?? PTVAPIError.unknown
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let apiResponse = try decoder.decode(T.self, from: data)
                completion?(.success(apiResponse))
            } catch {
                completion?(.failure(.requestFailed(baseError: error)))
            }
        }
    }
}

// MARK: - Non-Public Functions

extension PTVAPIAccess {

    /// Generates a URL request for the provided endpoint and parameters
    ///
    /// - Parameters:
    ///   - endpoint: Endpoint to generate the URL request from
    ///   - parameters: Parameter to include in the request
    /// - Returns: URLRequest, or nil if an error occurs
    func apiRequest(endpoint: PTVEndpointConfigurer, parameters: [URLQueryItem]?) -> URLRequest? {
        switch endpoint.method {
        case .get: return generateGetRequest(for: endpoint, parameters: parameters)
        case .post: return generatePostRequest(for: endpoint, parameters: parameters)
        }
    }

    /// Generates a GET HTTP request using the provided configuration
    ///
    /// - Parameter endpointConfiguration: Endpoint configuration to generate the request with
    /// - Returns: URLRequest, or nil if the configuration is invalid.
    private func generateGetRequest(for endpoint: PTVEndpointConfigurer, parameters: [URLQueryItem]?) -> URLRequest? {
        guard let endpointUrl = endpoint.url else { return nil }
        var components = URLComponents(url: endpointUrl, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters

        var request: URLRequest?
        if let componentUrl = components?.url?.signedUrl(environment: environment) {
            request = URLRequest(url: componentUrl)
        }

        request?.cachePolicy = endpoint.cachePolicy
        request?.httpMethod = endpoint.method.rawValue
        return request
    }

    /// Generates a POST HTTP request using the provided configuration
    ///
    /// - Parameter endpointConfiguration: Endpoint configuration to generate the request with
    /// - Returns: URLRequest, or nil if the configuration is invalid.
    private func generatePostRequest(for endpoint: PTVEndpointConfigurer, parameters: [URLQueryItem]?) -> URLRequest? {
        guard let endpointUrl = endpoint.url else { return nil }
        var components = URLComponents(url: endpointUrl, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters

        var request: URLRequest?
        if let componentUrl = components?.url?.signedUrl(environment: environment) {
            request = URLRequest(url: componentUrl)
        }

        request?.cachePolicy = endpoint.cachePolicy
        request?.httpMethod = endpoint.method.rawValue
        return request
    }
}

// MARK: - Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension PTVAPIAccess {

    /// Returns a publisher that performs an API request and emits the response, or an error if one is thrown
    ///
    /// - Parameters:
    ///   - endpoint: Endpoint to retreive data from
    ///   - parameters: Parameters to include in the request
    /// - Returns: `AnyPublisher` object that emits once the request completes or if an error is thrown.
    public func apiResponsePublisher<T: Decodable>(for endpoint: PTVEndpoint,
                                                   parameters: [PTVEndpointParameter]? = nil) -> APIPublisher<T> {

        guard let responseType = endpoint.responseType else {
            return Fail(outputType: T.self,
                        failure: .missingResponseType(endpoint: endpoint))
                .eraseToAnyPublisher()
        }

        guard T.self == endpoint.responseType else {
            return Fail(outputType: T.self,
                        failure: .incompatibleEndpoint(response: T.self,
                                                       endpoint: responseType))
                .eraseToAnyPublisher()
        }

        let parameterQueryItems = parameters?.flatMap { $0.urlQueryItems }

        guard let request = apiRequest(endpoint: endpoint, parameters: parameterQueryItems) else {
            return Fail(outputType: T.self,
                        failure: .cannotGenerateRequest)
                .eraseToAnyPublisher()
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return networkService
            .publisher(for: request)
            .decode(type: T.self, decoder: decoder)
            .mapError { return PTVAPIError.map($0) }
            .eraseToAnyPublisher()
    }
}
