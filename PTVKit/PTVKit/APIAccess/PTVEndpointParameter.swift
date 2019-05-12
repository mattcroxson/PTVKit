//
//  PTVEndpointParameter.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents URL query parameters passed into the API request.
public struct PTVEndpointParameter {

    /// Parameter name
    private let name: PTVEndpointParameterName

    /// Array of parameter values
    private let values: [CustomStringConvertible]

    /// Initialises an endpoint parameter with a single value
    ///
    /// - Parameters:
    ///   - name: Name of the parameter
    ///   - value: Value of the parameter
    public init(name: PTVEndpointParameterName, value: CustomStringConvertible) {
        self.name = name
        self.values = [value]
    }

    /// Initialises endpoint parameters with multiple values
    ///
    /// - Parameters:
    ///   - name: Name of the parameters
    ///   - values: Values of the parameters
    public init(name: PTVEndpointParameterName, values: [CustomStringConvertible]) {
        self.name = name
        self.values = values
    }

    /// Array of URL query items based on the name and values
    var urlQueryItems: [URLQueryItem] {
        return values.map { URLQueryItem(name: name.rawValue, value: $0.description ) }
    }
}
