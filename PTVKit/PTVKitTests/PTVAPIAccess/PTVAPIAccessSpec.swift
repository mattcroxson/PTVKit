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

                it("should generate a valid signed url") {
                    let requestUrl = URL(string: "https://timetableapi.ptv.vic.gov.au/v3/route_types")
                    let signedUrl = apiAccess.signedUrl(from: requestUrl)
                    let expectedSignedUrl = "https://timetableapi.ptv.vic.gov.au/v3/route_types?devid=MOCK_USER&signature=8029E3AC00940E6E3C071477A11E86A340F43F3D"
                    expect(signedUrl?.absoluteString).to(equal(expectedSignedUrl))
                }

                it("should contain expected components") {
                    let requestUrl = URL(string: "https://timetableapi.ptv.vic.gov.au/v3/route_types")
                    let signedUrl = apiAccess.signedUrl(from: requestUrl)
                    let components = URLComponents(url: signedUrl!, resolvingAgainstBaseURL: false)

                    let signatureQuery = URLQueryItem(name: "signature", value: "8029E3AC00940E6E3C071477A11E86A340F43F3D")
                    let devidQuery = URLQueryItem(name: "devid", value: "MOCK_USER")

                    expect(components?.queryItems).to(contain([signatureQuery, devidQuery]))
                }
            }

            context("when provided with an invalid URL") {
                
                it("should return a nil signed url") {
                    let requestUrl = URL(string: "this is not a valid URL")
                    let signedUrl = apiAccess.signedUrl(from: requestUrl)
                    expect(signedUrl?.absoluteString).to(beNil())
                }
            }
        }
    }
}
