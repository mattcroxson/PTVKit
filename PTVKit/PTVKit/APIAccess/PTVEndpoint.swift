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
    case routes
    case routeTypes

    var path: String {
        switch self {
        case let .route(routeId): return "/v3/routes/\(routeId)"
        case .routes: return "/v3/routes"
        case .routeTypes: return "/v3/route_types"
        }
    }
}
