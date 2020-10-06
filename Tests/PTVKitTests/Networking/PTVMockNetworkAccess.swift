//
//  PTVMockNetworkAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 6/10/20.
//  Copyright © 2020 Matt Croxson. All rights reserved.
//

@testable import PTVKit
import Combine

class PTVMockNetworkAccess: NetworkAccess {

    let dataResponse: Data?
    let failureResponse: Error?

    init(dataResponse: Data?,
         failureResponse: Error?) {
        self.dataResponse = dataResponse
        self.failureResponse = failureResponse
    }

    func process(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {

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
}

enum MockNetworkAccessError: LocalizedError {

    case missingUrl
    case noResponse

    var errorDescription: String? {
        switch self {
        case .missingUrl: return "The URL is missing from the request"
        case .noResponse: return "No data or failure responses were provided"
        }
    }
}
