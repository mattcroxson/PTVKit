//
//  PTVMockEndpoint.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
// swiftlint:disable all

@testable import PTVKit
import Foundation

enum PTVMockEndpoint {
    case mock
    case mockWithNilUrl
    case mockWithSingleParameter(parameter: String)
    case mockWithMultiParameter(first: String, second: String)
    case mockPost
    case mockPostWithNilUrl
    case mockPostWithSingleParameter(parameter: String)
    case mockPostWithMultiParameter(first: String, second: String)
}

extension PTVMockEndpoint: PTVEndpointConfigurer {
    var path: String {
        switch self {
        case .mock: return "/mock"
        case .mockWithNilUrl: return "/mock"
        case let .mockWithSingleParameter(parameter): return "/mockWithSingleParameter/parameter/\(parameter)"
        case let .mockWithMultiParameter(first, second): return "/mockWithMultiParameter/first/\(first)/second/\(second)"
        case .mockPost: return "/mock"
        case .mockPostWithNilUrl: return "/mock"
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

    var url: URL? {
        switch self {
        case .mockWithNilUrl,
             .mockPostWithNilUrl: return nil
        default:
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = path
            return components.url
        }
    }

    var responseType: Decodable.Type? {
        return nil
    }
}
