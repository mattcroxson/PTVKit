//
//  URLComponents+PTVKit.swift
//  PTVKit
//
//  Created by Matt Croxson on 21/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

extension URLComponents {
    var pathWithQuery: String {
        guard let urlQuery = query else { return path }
        let queryPath = path + "?" + urlQuery
        return queryPath
    }
}
