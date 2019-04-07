//
//  StopsByDistanceResponse.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public struct StopsByDistanceResponse: Decodable {
    public let stops: [StopsGeosearch]?
//    public let disruptions: [Any]?
    public let status: Status?
}
