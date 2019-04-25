//
//  PTVMockEndpoint.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

@testable import PTVKit

internal enum PTVMockEndpoint {
    case mock
    case mockWithSingleParameter(parameter: String)
    case mockWithMultiParameter(first: String, second: String)
    case mockPost
    case mockPostWithSingleParameter(parameter: String)
    case mockPostWithMultiParameter(first: String, second: String)
}

extension PTVMockEndpoint: PTVEndpointConfigurer {
    var path: String {
        switch self {
        case .mock: return "/mock"
        case let .mockWithSingleParameter(parameter): return "/mockWithSingleParameter/parameter/\(parameter)"
        case let .mockWithMultiParameter(first, second): return "/mockWithMultiParameter/first/\(first)/second/\(second)"
        case .mockPost: return "/mock"
        case let .mockPostWithSingleParameter(parameter): return "/mockWithSingleParameter/parameter/\(parameter)"
        case let .mockPostWithMultiParameter(first, second): return "/mockWithMultiParameter/first/\(first)/second/\(second)"
        }
    }

    var method: PTVHTTPMethod {
        switch self {
        case .mockPost,
             .mockPostWithSingleParameter,
             .mockPostWithMultiParameter: return .post
        default: return .get
        }
    }
}
