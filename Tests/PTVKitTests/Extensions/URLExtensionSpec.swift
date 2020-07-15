//
//  URLExtensionSpec.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 22/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
// swiftlint:disable all

@testable import PTVKit
import Foundation
import Quick
import Nimble

final class URLExtensionSpec: QuickSpec {
    override func spec() {
        let mockEnvironment = PTVMockDataService.mockEnvironment

        describe("URL+Extensions") {
            context("when the URL is valid") {
                var validUrl: URL!

                beforeEach {
                    validUrl = URL(string: "https://timetableapi.ptv.vic.gov.au/v3/route_types")
                }

                it("should generate a valid signature") {
                    expect(validUrl.signature(environment: mockEnvironment)).to(equal("AA016A5B2C603A6B4765C31D234AD58AD5D175D7"))
                }

                it("should correctly sign") {
                    expect(validUrl.signedUrl(environment: mockEnvironment)?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/route_types?devid=MOCK_USER&signature=8029E3AC00940E6E3C071477A11E86A340F43F3D"))
                }

                context("when signed") {
                    var signedUrl: URL!

                    beforeEach {
                        signedUrl = validUrl.signedUrl(environment: mockEnvironment)
                    }

                    it("should contain the correct components") {
                        let components = URLComponents(url: signedUrl, resolvingAgainstBaseURL: true)
                        let devIdComponent = URLQueryItem(name: "devid", value: "MOCK_USER")
                        let signatureComponent = URLQueryItem(name: "signature", value: "8029E3AC00940E6E3C071477A11E86A340F43F3D")

                        expect(components?.queryItems).to(contain([devIdComponent, signatureComponent]))
                    }
                }
            }

            context("when the URL is invalid") {
                var invalidUrl: URL?

                beforeEach {
                    invalidUrl = URL(string: "this is clearly not a valid URL")
                }

                it("should fail to generate a signature") {
                    expect(invalidUrl?.signature(environment: mockEnvironment)).to(beNil())
                }

                it("should fail to sign") {
                    expect(invalidUrl?.signedUrl(environment: mockEnvironment)).to(beNil())
                }
            }
        }
    }
}
