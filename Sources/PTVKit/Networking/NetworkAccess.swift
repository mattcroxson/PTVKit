//
//  NetworkAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 6/10/20.
//  Copyright © 2020 Matt Croxson. All rights reserved.
//

import Foundation
import Combine

protocol NetworkAccess {

    /// Performs a URLSessionDataTask using the provided request with the results provided to the completion handler
    /// - Parameters:
    ///   - request: Request to perform with the data task
    ///   - completion: Completion to handle the results of the data task.
    func process(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)

    /// Creates a Publisher for the provided data request
    /// - Parameter request: Request to create the publisher with
    /// - Returns: The created publisher
    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(for request: URLRequest) -> DataTaskPublisher
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
typealias DataTaskPublisher = AnyPublisher<Data, Error>

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
struct DataTaskResult {
    let data: Data
}
