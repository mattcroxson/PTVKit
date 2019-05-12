//
//  PTVAPIAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation
import CommonCrypto

/// Completion handler called when a URL request either receives a response or throws an error
public typealias PTVAPIResponseCompletion<T: Decodable> = (Result<T, PTVAPIError>) -> Void

/// Primary access point to the API
public class PTVAPIAccess {

    // MARK: - Properties

    private let environment: PTVAPIEnvironment

    // MARK: - PTVAPIAccess

    /// Initialises the PTV API access object
    ///
    /// - Parameters:
    ///   - configuration: Configuration provider to initialise the access object
    public init(configuration: PTVAPIConfigurationProvider) {
        self.environment = PTVAPIEnvironment(configuration: configuration)
    }

    /// Performs an API request and calls the completion handler once a response is received or an error is thrown.
    ///
    /// - Parameters:
    ///   - endpoint: Endpoint to retrieve data from
    ///   - parameters: Parameters to include in the request
    ///   - completion: Completion handler to call when the request completes or an error is thrown
    public func getResponse<T: Decodable>(from endpoint: PTVEndpoint, parameters: PTVEndpointParameter? = nil, completion: PTVAPIResponseCompletion<T>?) {

        guard T.self == endpoint.responseType else {
            completion?(.failure(PTVAPIError.incompatibleEndpoint))
            return
        }

        guard let request = apiRequest(endpoint: endpoint, parameters: parameters?.urlQueryItems) else {
            completion?(.failure(PTVAPIError.cannotGenerateRequest))
            return
        }

        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = environment.requestTimeout
        sessionConfiguration.timeoutIntervalForResource = environment.resourceTimeout
        sessionConfiguration.waitsForConnectivity = true

        let urlSession = URLSession(configuration: sessionConfiguration)

        let task = urlSession.dataTask(with: request) { (data, response, error) in
            do {
                guard let data = data,
                    let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode, error == nil else {
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
        task.resume()
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
