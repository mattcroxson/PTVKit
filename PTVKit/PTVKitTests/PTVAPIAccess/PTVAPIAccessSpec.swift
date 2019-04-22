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
                let endpoint = PTVEndpoint.route(routeId: 741)

                it("should have a valid url") {
                    let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                    expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/routes/741"))
                }
            }

            context("requesting stops by location") {
                let endpoint = PTVEndpoint.stopsByLocation(latitude: 0.0, longitude: 0.0)

                context("with no parameters") {
                    it("should have a valid url") {
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)

                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/location/0.0,0.0"))
                    }
                }

                context("with single route type") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "route_types", value: "1")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/location/0.0,0.0?route_types=1"))
                    }
                }

                context("with multiple route types") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "route_types", value: "1"),
                                          URLQueryItem(name: "route_types", value: "2")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/location/0.0,0.0?route_types=1&route_types=2"))
                    }
                }

                context("with max results") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "max_results", value: "100")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/location/0.0,0.0?max_results=100"))
                    }
                }

                context("with max distance") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "max_distance", value: "100")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/location/0.0,0.0?max_distance=100"))
                    }
                }

                context("with show disruptions set") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "show_disruptions", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/location/0.0,0.0?show_disruptions=true"))
                    }
                }
            }

            context("request stops on route") {
                let endpoint = PTVEndpoint.stopsOnRoute(routeId: 1, routeType: 1)

                context("with no parameters") {
                    it("should have a valid url") {
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/route/1/route_type/1"))
                    }
                }

                context("with direction id") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "direction_id", value: "1")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/route/1/route_type/1?direction_id=1"))
                    }
                }

                context("with disruptions") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_disruptions", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/route/1/route_type/1?stop_disruptions=true"))
                    }
                }

                context("with direction id and disruptions") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "direction_id", value: "1"),
                                          URLQueryItem(name: "stop_disruptions", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/route/1/route_type/1?direction_id=1&stop_disruptions=true"))
                    }
                }
            }

            context("request stop by id") {
                let endpoint = PTVEndpoint.stop(stopId: 1, routeType: 1)

                context("with no parameters") {
                    it("should have a valid url") {
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1"))
                    }
                }

                context("with stop location") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_location", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?stop_location=true"))
                    }
                }

                context("with stop amenities") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_amenities", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?stop_amenities=true"))
                    }
                }

                context("with stop accessibility") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_accessibility", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?stop_accessibility=true"))
                    }
                }

                context("with stop contact") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_contact", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?stop_contact=true"))
                    }
                }

                context("with stop ticket") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_ticket", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?stop_ticket=true"))
                    }
                }

                context("with gtfs") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "gtfs", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?gtfs=true"))
                    }
                }

                context("with stop staffing") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_staffing", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?stop_staffing=true"))
                    }
                }

                context("with stop disruptions") {
                    it("should have a valid url") {
                        let parameters = [URLQueryItem(name: "stop_disruptions", value: "true")]
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                        expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/v3/stops/1/route_type/1?stop_disruptions=true"))
                    }
                }
            }
        }
    }
}
