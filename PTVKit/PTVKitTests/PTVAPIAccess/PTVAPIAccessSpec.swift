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

public final class PTVAPIAccessSpec: QuickSpec {

    private let mockDataService = PTVMockDataService.shared

    public override func spec() {
        describe("PTVAPIAccess") {
            let apiAccess = PTVAPIAccess(configuration: mockDataService.mockConfiguration)
            let requestUrlString = "https://timetableapi.ptv.vic.gov.au/v3/stops/location/-37.828408,144.988557?stop_disruptions=true&devid=MOCK_USER"
            let requestUrl = URL(string: requestUrlString)
            let expectedSignature = "F1097A99367CD03CE9AB10A0E2039F6949AB0652"

            it("should generate correct signature for a valid URL") {
                expect(apiAccess.signature(for: requestUrl)).to(equal(expectedSignature))
            }

            it("should fail if a url is not valid") {
                expect(apiAccess.signature(for: nil)).to(beNil())
            }

            it("should generate a correctly signed URL for a valid URL") {
                let url = URL(string: "https://timetableapi.ptv.vic.gov.au/v3/stops/location/-37.828408,144.988557?stop_disruptions=true")
                let signedUrl = apiAccess.signedUrl(from: url)
                let urlString = signedUrl?.absoluteString ?? ""
                let components = URLComponents(string: urlString)

                let signatureQuery = URLQueryItem(name: "signature", value: expectedSignature)
                let devidQuery = URLQueryItem(name: "devid", value: "MOCK_USER")
                let stopDisruptionsQuery = URLQueryItem(name: "stop_disruptions", value: "true")

                expect(url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/location/-37.828408,144.988557?stop_disruptions=true"))
                expect(signedUrl).toNot(beNil())
                expect(signedUrl?.absoluteString).to(equal("\(requestUrlString)&signature=\(expectedSignature)"))
                expect(components?.queryItems).to(contain([stopDisruptionsQuery, signatureQuery, devidQuery]))
            }
        }
    }
}
