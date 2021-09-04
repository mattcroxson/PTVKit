//
//  PTVAPIAccessCombineSpec.swift
//  PTVAPIAccessCombineSpec
//
//  Created by Matt Croxson on 4/9/21.
//  Copyright © 2021 Matt Croxson. All rights reserved.
//
// swiftlint:disable all

@testable import PTVKit
import Foundation
import Quick
import Nimble
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class PTVAPIAccessCombineSpec: QuickSpec {
    override func spec() {

        describe("PTVAPIAccess") {

            let mockEnvironment = PTVMockDataService.mockEnvironment
            var apiAccess: PTVAPIAccess!

            describe("getting a publisher from a get endpoint") {

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

                        afterEach {
                            apiAccess = nil
                        }

                        it("should return a mock object") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                _ = apiAccess
                                    .responsePublisher(for: endpoint)
                                    .sink { completion in
                                        switch completion {
                                        case .finished: done()
                                        case let .failure(error):
                                            mockError = error
                                            done()
                                        }
                                    } receiveValue: { (value: MockDecodable) in
                                        mockValue = value
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

                        afterEach {
                            apiAccess = nil
                        }

                        it("should return a mock object") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                _ = apiAccess
                                    .responsePublisher(for: endpoint)
                                    .sink { completion in
                                        switch completion {
                                        case .finished: done()
                                        case let .failure(error):
                                            mockError = error
                                            done()
                                        }
                                    } receiveValue: { (value: MockDecodable) in
                                        mockValue = value
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

                        afterEach {
                            apiAccess = nil
                        }

                        it("should return a mock object") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                _ = apiAccess
                                    .responsePublisher(for: endpoint)
                                    .sink { completion in
                                        switch completion {
                                        case .finished: done()
                                        case let .failure(error):
                                            mockError = error
                                            done()
                                        }
                                    } receiveValue: { (value: MockDecodable) in
                                        mockValue = value
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

                        afterEach {
                            apiAccess = nil
                        }

                        it("should fail") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                _ = apiAccess
                                    .responsePublisher(for: endpoint)
                                    .sink { completion in
                                        switch completion {
                                        case .finished: done()
                                        case let .failure(error):
                                            mockError = error
                                            done()
                                        }
                                    } receiveValue: { (value: MockDecodable) in
                                        mockValue = value
                                    }
                            }

                            expect(mockValue?.mockValue).to(beNil())
                            expect(mockError).to(equal(PTVAPIError.missingResponseType(endpoint: "mockGetWithNilUrl")))
                        }
                    }

                    context("with an incompatible response type") {
                        let endpoint = PTVMockEndpoint.mockGetWithIncompatibleResponseType
                        let mockResponse = MockDecodable(mockValue: "mockValue").asData
                        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                                     failureResponse: nil)

                        beforeEach {
                            apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                                     networkAccess: mockNetworkAccess)
                        }

                        afterEach {
                            apiAccess = nil
                        }

                        it("should fail") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                _ = apiAccess
                                    .responsePublisher(for: endpoint)
                                    .sink { completion in
                                        switch completion {
                                        case .finished: done()
                                        case let .failure(error):
                                            mockError = error
                                            done()
                                        }
                                    } receiveValue: { (value: MockDecodable) in
                                        mockValue = value
                                    }
                            }

                            expect(mockValue?.mockValue).to(beNil())
                            expect(mockError)
                                .to(equal(PTVAPIError.incompatibleEndpoint(response: MockDecodable.self,
                                                                           endpoint: MockIncompatibleDecodable.self)))
                        }
                    }

                    context("with an HTTP error") {

                        let endpoint = PTVMockEndpoint.mockGet
                        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: nil,
                                                                     failureResponse: MockNetworkAccessError.badHTTPStatus(404),
                                                                     httpStatus: 404)

                        beforeEach {
                            apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                                     networkAccess: mockNetworkAccess)
                        }

                        afterEach {
                            apiAccess = nil
                        }

                        it("should fail with a 404") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                _ = apiAccess
                                    .responsePublisher(for: endpoint)
                                    .sink { completion in
                                        switch completion {
                                        case .finished: done()
                                        case let .failure(error):
                                            mockError = error
                                            done()
                                        }
                                    } receiveValue: { (value: MockDecodable) in
                                        mockValue = value
                                    }
                            }

                            expect(mockValue?.mockValue).to(beNil())
                            expect(mockError?.localizedDescription).to(equal("HTTP status 404"))
                        }
                    }

                    context("with an missing error") {

                        let endpoint = PTVMockEndpoint.mockGet
                        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: nil,
                                                                     failureResponse: nil,
                                                                     httpStatus: 404)

                        beforeEach {
                            apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                                     networkAccess: mockNetworkAccess)
                        }

                        afterEach {
                            apiAccess = nil
                        }

                        it("should fail with an unknown error") {
                            var mockValue: MockDecodable?
                            var mockError: PTVAPIError?

                            waitUntil { done in
                                _ = apiAccess
                                    .responsePublisher(for: endpoint)
                                    .sink { completion in
                                        switch completion {
                                        case .finished: done()
                                        case let .failure(error):
                                            mockError = error
                                            done()
                                        }
                                    } receiveValue: { (value: MockDecodable) in
                                        mockValue = value
                                    }
                            }

                            expect(mockValue?.mockValue).to(beNil())
                            expect(mockError?.localizedDescription).to(equal("No data or failure responses were provided"))
                        }
                    }
                }
            }
        }
    }
}
