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
            let mockEnvironment = PTVMockDataService.mockEnvironment
            var apiAccess: PTVAPIAccess!

            beforeEach {
                apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration)
            }

            context("requesting route types") {
                let endpoint = PTVEndpoint.routeTypes

                it("should have a valid url") {
                    let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                    expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/route_types"))
                }
            }

            context("request routes") {
                let endpoint = PTVEndpoint.routes

                context("with no parameters") {
                    it("should have a valid url") {
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes"))
                    }
                }

                context("with route name filter") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "route_name", value: "Balwyn")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes?route_name=Balwyn"))
                    }
                }

                context("with single route type") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "route_types", value: "1")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes?route_types=1"))
                    }
                }

                context("with multiple route types") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "route_types", value: "1"),
                                          URLQueryItem(name: "route_types", value: "2")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes?route_types=1&route_types=2"))
                    }
                }

                context("with route name filter and single route type") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "route_types", value: "1"),
                                          URLQueryItem(name: "route_name", value: "Balwyn")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes?route_types=1&route_name=Balwyn"))
                    }
                }

                context("with route name filter and multiple route types") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "route_types", value: "1"),
                                          URLQueryItem(name: "route_types", value: "2"),
                                          URLQueryItem(name: "route_name", value: "Balwyn")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes?route_types=1&route_types=2&route_name=Balwyn"))
                    }
                }
            }

            context("requesting routes by route id") {
                let endpoint = PTVEndpoint.route(routeId: "741")

                it("should have a valid url") {
                    let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                    expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes/741"))
                }
            }
        }
    }
}
