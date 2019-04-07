//
//  StopStaffing.swift
//  PTVKit
//
//  Created by Matt Croxson on 7/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Represents staffing details for the stop
public struct StopStaffing: Decodable {
    public let friAmFrom: String?
    public let friAmTo: String?
    public let friPmFrom: String?
    public let friPmTo: String?
    public let monAmFrom: String?
    public let monAmTo: String?
    public let monPmFrom: String?
    public let monPmTo: String?
    public let phAdditionalTest: String?
    public let phFrom: String?
    public let phTo: String?
    public let satAmFrom: String?
    public let satAmTo: String?
    public let satPmFrom: String?
    public let satPmTo: String?
    public let sunAmFrom: String?
    public let sunAmTo: String?
    public let sunPmFrom: String?
    public let sunPmTo: String?
    public let thuAmFrom: String?
    public let thuAmTo: String?
    public let thuPmFrom: String?
    public let thuPmTo: String?
    public let tueAmFrom: String?
    public let tueAmTo: String?
    public let tuePmFrom: String?
    public let tuePmTo: String?
    public let wedAmFrom: String?
    public let wedAmTo: String?
    public let wedPmFrom: String?
    public let wedPmTo: String?
}
