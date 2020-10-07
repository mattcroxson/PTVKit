//
//  PTVAPIAccessSpec.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
// swiftlint:disable all

@testable import PTVKit
import Foundation
import Quick
import Nimble

final class PTVAPIAccessSpec: QuickSpec {
    override func spec() {

        describe("PTVAPIAccess") {

            let mockEnvironment = PTVMockDataService.mockEnvironment
            var apiAccess: PTVAPIAccess!

            describe("accessing a get endpoint") {

                beforeEach {
                    apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration)
                }

                context("with no path parameters") {

                    let endpoint = PTVMockEndpoint.mockGet

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?devid=MOCK_USER&signature=8904DF2FBB92C2A2E3D33181FD73A3D9AFBEE180"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?mockItem=mockValue&devid=MOCK_USER&signature=600CABEA20A33C63C6DE93627C8C2B3122BDB461"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?firstMock=mockValue&secondMock=mockValue&devid=MOCK_USER&signature=96CF1C3E39CCE0E69431B350E6D1EF39B1DDE6D2"))
                        }
                    }
                }

                context("with a single path parameter") {

                    let endpoint = PTVMockEndpoint.mockGetWithSingleParameter(parameter: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?devid=MOCK_USER&signature=7306EB5C53B0A25264B841176C0F39AB1B2D2415"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?mockItem=mockValue&devid=MOCK_USER&signature=3CBEE8F8929518942B9BB146E226EA174901F0D7"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?firstMock=mockValue&secondMock=mockValue&devid=MOCK_USER&signature=31F7EB21FBFCA7E13A95B7128CD726A83C7B70DD"))
                        }
                    }
                }

                context("with multiple path parameters") {

                    let endpoint = PTVMockEndpoint.mockGetWithMultiParameter(first: "mock", second: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?devid=MOCK_USER&signature=060D4D1DE52849A8C8B33A194682BD86579A266E"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?mockItem=mockValue&devid=MOCK_USER&signature=E98726930B4FA2B33998A78200BC292C0F4D7E68"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("GET"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?firstMock=mockValue&secondMock=mockValue&devid=MOCK_USER&signature=7C67B0DFC47F0321FCC5EF88635795EA43DFABCF"))
                        }
                    }
                }

                context("with a nil url") {
                    let endpoint = PTVMockEndpoint.mockGetWithNilUrl

                    it("should fail") {
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                        expect(request?.url).to(beNil())
                    }
                }
            }

            describe("accessing a post endpoint") {

                beforeEach {
                    apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration)
                }

                context("with no path parameters") {

                    let endpoint = PTVMockEndpoint.mockPost

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?devid=MOCK_USER&signature=8904DF2FBB92C2A2E3D33181FD73A3D9AFBEE180"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?mockItem=mockValue&devid=MOCK_USER&signature=600CABEA20A33C63C6DE93627C8C2B3122BDB461"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mock?firstMock=mockValue&secondMock=mockValue&devid=MOCK_USER&signature=96CF1C3E39CCE0E69431B350E6D1EF39B1DDE6D2"))
                        }
                    }
                }

                context("with a single path parameter") {

                    let endpoint = PTVMockEndpoint.mockPostWithSingleParameter(parameter: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?devid=MOCK_USER&signature=7306EB5C53B0A25264B841176C0F39AB1B2D2415"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?mockItem=mockValue&devid=MOCK_USER&signature=3CBEE8F8929518942B9BB146E226EA174901F0D7"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithSingleParameter/parameter/mock?firstMock=mockValue&secondMock=mockValue&devid=MOCK_USER&signature=31F7EB21FBFCA7E13A95B7128CD726A83C7B70DD"))
                        }
                    }
                }

                context("with multiple path parameters") {

                    let endpoint = PTVMockEndpoint.mockPostWithMultiParameter(first: "mock", second: "mock")

                    context("with no query parameters") {
                        it("should have a valid url") {
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?devid=MOCK_USER&signature=060D4D1DE52849A8C8B33A194682BD86579A266E"))
                        }
                    }

                    context("with a single query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "mockItem", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?mockItem=mockValue&devid=MOCK_USER&signature=E98726930B4FA2B33998A78200BC292C0F4D7E68"))
                        }
                    }

                    context("with multiple query parameter") {
                        it("should have a valid url") {
                            let parameters = [URLQueryItem(name: "firstMock", value: "mockValue"),
                                              URLQueryItem(name: "secondMock", value: "mockValue")]
                            let request = apiAccess.apiRequest(endpoint: endpoint, parameters: parameters)
                            expect(request?.httpMethod).to(equal("POST"))
                            expect(request?.url?.absoluteString).to(equal("https://timetableapi.ptv.vic.gov.au/mockWithMultiParameter/first/mock/second/mock?firstMock=mockValue&secondMock=mockValue&devid=MOCK_USER&signature=7C67B0DFC47F0321FCC5EF88635795EA43DFABCF"))
                        }
                    }
                }

                context("with a nil url") {
                    let endpoint = PTVMockEndpoint.mockPostWithNilUrl

                    it("should fail") {
                        let request = apiAccess.apiRequest(endpoint: endpoint, parameters: nil)
                        expect(request?.url).to(beNil())
                    }
                }
            }

            describe("getting a response from a get endpoint") {

                context("with no path parameters") {

                    context("with no query paramters") {

                        let endpoint = PTVMockEndpoint.mockGet
                        let mockResponse = MockDecodable(mockValue: "mockValue").asData
                        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                                     failureResponse: nil)

                        beforeEach {
                            apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                                     networkAccess: mockNetworkAccess)
                        }

                        it("should return a mock object") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                apiAccess.response(from: endpoint) { (result: Result<MockDecodable, PTVAPIError>) in
                                    switch result {
                                    case let .success(value): mockValue = value
                                    case let .failure(error): mockError = error
                                    }
                                    done()
                                }
                            }

                            expect(mockValue?.mockValue).to(equal("mockValue"))
                            expect(mockError).to(beNil())
                        }
                    }

                    context("with a single query parameter") {
                        let endpoint = PTVMockEndpoint.mockGetWithSingleParameter(parameter: "mock")
                        let mockResponse = MockDecodable(mockValue: "mockValue").asData
                        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                                     failureResponse: nil)

                        beforeEach {
                            apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                                     networkAccess: mockNetworkAccess)
                        }

                        it("should return a mock object") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                apiAccess.response(from: endpoint) { (result: Result<MockDecodable, PTVAPIError>) in
                                    switch result {
                                    case let .success(value): mockValue = value
                                    case let .failure(error): mockError = error
                                    }
                                    done()
                                }
                            }

                            expect(mockValue?.mockValue).to(equal("mockValue"))
                            expect(mockError).to(beNil())
                        }
                    }

                    context("with multiple query paramters") {
                        let endpoint = PTVMockEndpoint.mockGetWithMultiParameter(first: "first", second: "second")
                        let mockResponse = MockDecodable(mockValue: "mockValue").asData
                        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                                     failureResponse: nil)

                        beforeEach {
                            apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                                     networkAccess: mockNetworkAccess)
                        }

                        it("should return a mock object") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                apiAccess.response(from: endpoint) { (result: Result<MockDecodable, PTVAPIError>) in
                                    switch result {
                                    case let .success(value): mockValue = value
                                    case let .failure(error): mockError = error
                                    }
                                    done()
                                }
                            }

                            expect(mockValue?.mockValue).to(equal("mockValue"))
                            expect(mockError).to(beNil())
                        }
                    }

                    context("with a nil url") {
                        let endpoint = PTVMockEndpoint.mockGetWithNilUrl
                        let mockResponse = MockDecodable(mockValue: "mockValue").asData
                        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                                     failureResponse: nil)

                        beforeEach {
                            apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                                     networkAccess: mockNetworkAccess)
                        }

                        it("should return a mock object") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                apiAccess.response(from: endpoint) { (result: Result<MockDecodable, PTVAPIError>) in
                                    switch result {
                                    case let .success(value): mockValue = value
                                    case let .failure(error): mockError = error
                                    }
                                    done()
                                }
                            }

                            expect(mockValue?.mockValue).to(beNil())
                            expect(mockError).to(equal(PTVAPIError.missingResponseType(endpoint: "mockGetWithNilUrl")))
                        }
                    }
                }
            }
        }
    }
}

struct MockDecodable: Codable, DataRepresentable {
    let mockValue: String

    init(mockValue: String) {
        self.mockValue = "mockValue"
    }
}

protocol DataRepresentable where Self: Codable {}
extension DataRepresentable {
    var asData: Data {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(self)
            return data
        } catch {
            fatalError("Tried to encode by failed: \(error.localizedDescription)")
        }
    }
}
