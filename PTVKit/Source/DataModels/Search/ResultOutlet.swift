//
//  ResultOutlet.swift
//  PTVKit
//
//  Created by Matt Croxson on 25/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

/// Myki ticket outlet
public struct ResultOutlet: Codable {

    /// Distance of outlet from input location (in metres). 0 if no location is input.
    public let outletDistance: Double?

    /// The SLID/SPID
    public let outletSlidSpid: String?

    /// The location name of the outlet
    public let outletName: String?

    /// The business name of the outlet
    public let outletBusiness: String?

    /// Geographic coordinate (latitude) of outlet
    public let outletLatitude: Double?

    /// Geographic coordinate (latitude) of outlet
    public let outletLongitude: Double?

    /// The city/municipality the outlet is in
    public let outletSuburb: String?

    /// The postcode for the outlet
    public let outletPostcode: String?

    /// The business hours on Monday
    public let outletBusinessHourMon: String?

    /// The business hours on Tuesday
    public let outletBusinessHourTue: String?

    /// The business hours on Wednesday
    public let outletBusinessHourWed: String?

    /// The business hours on Thursday
    public let outletBusinessHourThur: String?

    /// The business hours on Friday
    public let outletBusinessHourFri: String?

    /// The business hours on Saturday
    public let outletBusinessHourSat: String?

    /// The business hours on Sunday
    public let outletBusinessHourSun: String?

    /// Any additional notes for the outlet such as 'Buy pre-loaded myki cards only'
    public let outletNotes: String?
}
