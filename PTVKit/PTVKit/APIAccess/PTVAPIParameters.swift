//
//  PTVAPIParameters.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public struct PTVAPIParameters {

    private let name: String
    private let values: [CustomStringConvertible]

    public init(name: String, value: CustomStringConvertible) {
        self.name = name
        self.values = [value]
    }

    public init(name: String, values: [CustomStringConvertible]) {
        self.name = name
        self.values = values
    }

    internal var urlQueryItems: [URLQueryItem] {
        return values.map { URLQueryItem(name: name, value: $0.description ) }
    }
}
