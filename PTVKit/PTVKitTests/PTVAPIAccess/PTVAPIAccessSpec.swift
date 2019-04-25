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

            describe("accessing a get endpoint") {

                context("with no path parameters") {

                    let endpoint = PTVMockEndpoint.mock

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?mockItem=mockValue"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?firstMock=mockValue&secondMock=mockValue"))
                        }
                    }
                }

                context("with a single path parameter") {

                    let endpoint = PTVMockEndpoint.mockWithSingleParameter(parameter: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?mockItem=mockValue"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?firstMock=mockValue&secondMock=mockValue"))
                        }
                    }
                }

                context("with multiple path parameters") {

                    let endpoint = PTVMockEndpoint.mockWithMultiParameter(first: "mock", second: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?mockItem=mockValue"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?firstMock=mockValue&secondMock=mockValue"))
                        }
                    }
                }
            }

            describe("accessing a post endpoint") {

                context("with no path parameters") {

                    let endpoint = PTVMockEndpoint.mockPost

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?mockItem=mockValue"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?firstMock=mockValue&secondMock=mockValue"))
                        }
                    }
                }

                context("with a single path parameter") {
                    
                    let endpoint = PTVMockEndpoint.mockPostWithSingleParameter(parameter: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?mockItem=mockValue"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?firstMock=mockValue&secondMock=mockValue"))
                        }
                    }
                }

                context("with multiple path parameters") {

                    let endpoint = PTVMockEndpoint.mockPostWithMultiParameter(first: "mock", second: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?mockItem=mockValue"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?firstMock=mockValue&secondMock=mockValue"))
                        }
                    }
                }
            }
        }
    }
}
