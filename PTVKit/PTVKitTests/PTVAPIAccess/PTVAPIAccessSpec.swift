//
//  PTVAPIAccessSpec.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

@testable import PTVKit
import Quick
import Nimble

final class PTVAPIAccessSpec: QuickSpec {


    override func spec() {
        describe("PTVAPIAccess") {

            var mockDataService: PTVMockDataService!
            var apiAccess: PTVAPIAccess!

            beforeEach {
                mockDataService = PTVMockDataService()
                apiAccess = PTVAPIAccess(configuration: mockDataService.mockConfiguration)
            }

            context("when provided with a valid URL") {
                it("should generate a valid signature") {
                    let requestUrl = URL(string: "https://timetableapi.ptv.vic.gov.au/v3/stops/location/-37.828408,144.988557?stop_disruptions=true&devid=MOCK_USER")
                    expect(apiAccess.signature(for: requestUrl)).to(equal("F1097A99367CD03CE9AB10A0E2039F6949AB0652"))
                }

                it("should generate a valid signed url") {
                    let requestUrl = URL(string: "https://timetableapi.ptv.vic.gov.au/v3/stops/location/-37.828408,144.988557?stop_disruptions=true")
                    let signedUrl = apiAccess.signedUrl(from: requestUrl)
                    let expectedSignedUrl = "https://timetableapi.ptv.vic.gov.au/v3/stops/location/-37.828408,144.988557?stop_disruptions=true&devid=MOCK_USER&signature=F1097A99367CD03CE9AB10A0E2039F6949AB0652"
                    expect(signedUrl?.absoluteString).to(equal(expectedSignedUrl))
                }

                it("should contain expected components") {
                    let requestUrl = URL(string: "https://timetableapi.ptv.vic.gov.au/v3/stops/location/-37.828408,144.988557?stop_disruptions=true")
                    let signedUrl = apiAccess.signedUrl(from: requestUrl)
                    let components = URLComponents(url: signedUrl!, resolvingAgainstBaseURL: false)

                    let signatureQuery = URLQueryItem(name: "signature", value: "F1097A99367CD03CE9AB10A0E2039F6949AB0652")
                    let devidQuery = URLQueryItem(name: "devid", value: "MOCK_USER")
                    let stopDisruptionsQuery = URLQueryItem(name: "stop_disruptions", value: "true")

                    expect(components?.queryItems).to(contain([signatureQuery, devidQuery, stopDisruptionsQuery]))
                }
            }

            context("when provided with an invalid URL") {
                it("should return a nil signature") {
                    let requestUrl = URL(string: "this is not a valid URL")
                    expect(apiAccess.signature(for: requestUrl)).to(beNil())
                }

                it("should return a nil signed url") {
                    let requestUrl = URL(string: "this is not a valid URL")
                    let signedUrl = apiAccess.signedUrl(from: requestUrl)
                    expect(signedUrl?.absoluteString).to(beNil())
                }
            }
        }
    }
}
