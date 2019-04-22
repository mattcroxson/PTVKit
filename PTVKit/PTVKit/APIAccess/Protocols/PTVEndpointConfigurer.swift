//
//  PTVEndpointConfigurer.swift
//  PTVKit
//
//  Created by Matt Croxson on 22/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Provides API access conifiguration items.
internal protocol PTVEndpointConfigurer {
    var host: String { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}

extension PTVEndpointConfigurer {
    var scheme: String { return "https" }
    var cachePolicy: URLRequest.CachePolicy {
        return URLRequest.CachePolicy.useProtocolCachePolicy
    }
    var headers: [String: String]? {
        return nil
    }
}

internal enum HTTPMethod: String {
    case post, get
}
