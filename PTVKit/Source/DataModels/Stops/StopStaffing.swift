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

    /// Stop Staffing Hours (Friday AM Start)
    public let friAmFrom: String?

    /// Stop Staffing Hours (Friday AM End)
    public let friAmTo: String?

    /// Stop Staffing Hours (Friday Afternoon Start)
    public let friPmFrom: String?

    /// Stop Staffing Hours (Friday Afternoon End)
    public let friPmTo: String?

    /// Stop Staffing Hours (Monday AM Start)
    public let monAmFrom: String?

    /// Stop Staffing Hours (Monday AM End)
    public let monAmTo: String?

    /// Stop Staffing Hours (Monday Afternoon Start)
    public let monPmFrom: String?
    
    /// Stop Staffing Hours (Monday Afternoon End)
    public let monPmTo: String?

    /// Stop Staffing Hours (Public Holiday Extra Info)
    public let phAdditionalText: String?

    /// Stop Staffing Hours (Public Holiday Start)
    public let phFrom: String?

    /// Stop Staffing Hours (Public Holiday End)
    public let phTo: String?

    /// Stop Staffing Hours (Saturday AM Start)
    public let satAmFrom: String?

    /// Stop Staffing Hours (Saturday AM End)
    public let satAmTo: String?

    /// Stop Staffing Hours (Saturday Afternoon Start)
    public let satPmFrom: String?

    /// Stop Staffing Hours (Saturday Afternoon End)
    public let satPmTo: String?

    /// Stop Staffing Hours (Sunday AM Start)
    public let sunAmFrom: String?

    /// Stop Staffing Hours (Sunday AM End)
    public let sunAmTo: String?

    /// Stop Staffing Hours (Sunday Afternoon Start)
    public let sunPmFrom: String?

    /// Stop Staffing Hours (Sunday Afternoon End)
    public let sunPmTo: String?

    /// Stop Staffing Hours (Thursday AM Start)
    public let thuAmFrom: String?

    /// Stop Staffing Hours (Thursday AM End)
    public let thuAmTo: String?

    /// Stop Staffing Hours (Thursday Afternoon Start)
    public let thuPmFrom: String?

    /// Stop Staffing Hours (Thursday Afternoon End)
    public let thuPmTo: String?

    /// Stop Staffing Hours (Tuesday AM Start)
    public let tueAmFrom: String?

    /// Stop Staffing Hours (Tuesday AM End)
    public let tueAmTo: String?

    /// Stop Staffing Hours (Tuesday Afternoon Start)
    public let tuePmFrom: String?

    /// Stop Staffing Hours (Tuesday Afternoon End)
    public let tuePmTo: String?

    /// Stop Staffing Hours (Wednesday AM Start)
    public let wedAmFrom: String?

    /// Stop Staffing Hours (Wednesday AM End)
    public let wedAmTo: String?

    /// Stop Staffing Hours (Wednesday Afternoon Start)
    public let wedPmFrom: String?

    /// Stop Staffing Hours (Wednesday Afternoon End)
    public let wedPmTo: String?
}
