//
//  PTVEndpoint.swift
//  PTVKit
//
//  Created by Matt Croxson on 22/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

internal enum PTVEndpoint: PTVEndpointConfigurer {

    // Endpoints
    case route(routeId: String)
    case routes(routeTypes: [Int]?, routeName: String?)
    case routeTypes

    var path: String {
        switch self {
        case .route, .routes: return "route"
        case .routeTypes: return "route_types"
        }
    }
}
