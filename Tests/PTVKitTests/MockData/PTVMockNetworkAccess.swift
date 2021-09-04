//
//  PTVMockNetworkAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 6/10/20.
//  Copyright © 2020 Matt Croxson. All rights reserved.
//

@testable import PTVKit
import Foundation
import Combine

class PTVMockNetworkAccess: NetworkAccess {
    let dataResponse: Data?
    let failureResponse: Error?
    let httpStatus: Int

    init(dataResponse: Data?,
         failureResponse: Error?,
         httpStatus: Int = 200) {
        self.dataResponse = dataResponse
        self.failureResponse = failureResponse
        self.httpStatus = httpStatus
    }

    func process(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = request.url else {
            return completion(nil, nil, MockNetworkAccessError.missingUrl)
        }

        let response = HTTPURLResponse.response(for: url, statusCode: httpStatus)

        if let data = dataResponse {
            return completion(data, response, nil)
        } else if let failure = failureResponse {
            return completion(nil, nil, failure)
        }
        return completion(nil, response, nil)
    }

    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(for request: URLRequest) -> DataTaskPublisher {
        if let data = dataResponse {
            return Result
                .success(data)
                .publisher
                .eraseToAnyPublisher()
        } else if let failure = failureResponse {
            return Fail(error: failure)
                .eraseToAnyPublisher()
        }

        return Result
            .failure(MockNetworkAccessError.noResponse)
            .publisher
            .eraseToAnyPublisher()
    }

    @available(OSX 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func process(request: URLRequest) async throws -> Data {
        if let data = dataResponse {
            return data
        } else if let failure = failureResponse {
            throw failure
        }

        throw MockNetworkAccessError.noResponse
    }
}

enum MockNetworkAccessError: LocalizedError {
    case missingUrl
    case noResponse
    case badHTTPStatus(Int)

    var errorDescription: String? {
        switch self {
        case .missingUrl: return "The URL is missing from the request"
        case .noResponse: return "No data or failure responses were provided"
        case let .badHTTPStatus(status): return "HTTP status \(status)"
        }
    }
}

extension HTTPURLResponse {
    static func response(for url: URL, statusCode: Int = 200) -> HTTPURLResponse? {
        HTTPURLResponse(url: url,
                        statusCode: statusCode,
                        httpVersion: nil,
                        headerFields: nil)
    }
}
