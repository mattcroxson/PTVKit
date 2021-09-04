//
//  PTVAPIAccessUnitTests.swift
//  PTVAPIAccessUnitTests
//
//  Created by Matt Croxson on 3/9/21.
//  Copyright © 2021 Matt Croxson. All rights reserved.
//

// swiftlint:disable line_length

import XCTest

@testable import PTVKit

@available(OSX 12, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class PTVAPIAccessUnitTests: XCTestCase {

    let mockEnvironment = PTVMockDataService.mockEnvironment
    var apiAccess: PTVAPIAccess!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiAccess = nil
    }

    func testAsyncAccessingEndpointWithNoPathNoQuery() async throws {
        let endpoint = PTVMockEndpoint.mockGet
        let mockResponse = MockDecodable(mockValue: "mockValue").asData
        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                     failureResponse: nil)
        apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                 networkAccess: mockNetworkAccess)

        let response: MockDecodable = try await apiAccess.response(for: endpoint, parameters: nil)

        XCTAssert(response.mockValue == "mockValue")
    }

    func testAsyncAccessingEndpointWithNoPathSingleQuery() async throws {

        let endpoint = PTVMockEndpoint.mockGetWithSingleParameter(parameter: "mock")
        let mockResponse = MockDecodable(mockValue: "mockValue").asData
        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                     failureResponse: nil)
        apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                 networkAccess: mockNetworkAccess)

        let response: MockDecodable = try await apiAccess.response(for: endpoint, parameters: nil)

        XCTAssert(response.mockValue == "mockValue")
    }

    func testAsyncAccessingEndpointWithNoPathMultipleQuery() async throws {
        let endpoint = PTVMockEndpoint.mockGetWithMultiParameter(first: "first", second: "second")
        let mockResponse = MockDecodable(mockValue: "mockValue").asData
        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                     failureResponse: nil)
        apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                 networkAccess: mockNetworkAccess)

        let response: MockDecodable = try await apiAccess.response(for: endpoint, parameters: nil)

        XCTAssert(response.mockValue == "mockValue")
    }

    func testAsyncAccessingEndpointWithNilUrl() async throws {
        let endpoint = PTVMockEndpoint.mockGetWithNilUrl
        let mockResponse = MockDecodable(mockValue: "mockValue").asData
        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                     failureResponse: nil)
        apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                 networkAccess: mockNetworkAccess)

        do {
            let response: MockDecodable = try await apiAccess.response(for: endpoint, parameters: nil)
            XCTFail("This function should throw an error, returned response: \(response)")
        } catch let error as PTVAPIError {
            XCTAssert(error.localizedDescription == "The endpoint mockGetWithNilUrl is missing a response type.",
                      "Unexpected error description: \(error.localizedDescription)")
        } catch {
            XCTFail("Returned unexpected error: \(type(of: error)) -> \(error.self) \(error.localizedDescription)")
        }
    }

    func testAsyncAccessingEndpointWithIncompatibleResponseType() async throws {
        let endpoint = PTVMockEndpoint.mockGetWithIncompatibleResponseType
        let mockResponse = MockDecodable(mockValue: "mockValue").asData
        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: mockResponse,
                                                     failureResponse: nil)
        apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                 networkAccess: mockNetworkAccess)

        do {
            let response: MockDecodable = try await apiAccess.response(for: endpoint, parameters: nil)
            XCTFail("This function should throw an error, returned response: \(response)")
        } catch let error as PTVAPIError {
            XCTAssert(error.localizedDescription == "The API response MockDecodable selected does not match the endpoint response MockIncompatibleDecodable",
                      "Unexpected error description: \(error.localizedDescription)")
        } catch {
            XCTFail("Returned unexpected error: \(type(of: error)) -> \(error.self) \(error.localizedDescription)")
        }
    }

    func testAsyncAccessingEndpointWithHTTP404Error() async throws {
        let endpoint = PTVMockEndpoint.mockGet
        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: nil,
                                                     failureResponse: MockNetworkAccessError.badHTTPStatus(404),
                                                     httpStatus: 404)
        apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                 networkAccess: mockNetworkAccess)

        do {
            let response: MockDecodable = try await apiAccess.response(for: endpoint, parameters: nil)
            XCTFail("This function should throw an error, returned response: \(response)")
        } catch let error as MockNetworkAccessError {
            XCTAssert(error.localizedDescription == "HTTP status 404",
                      "Unexpected error description: \(error.localizedDescription)")
        } catch {
            XCTFail("Returned unexpected error: \(type(of: error)) -> \(error.self) \(error.localizedDescription)")
        }
    }

    func testAsyncAccessingEndpointWithMissingError() async throws {
        let endpoint = PTVMockEndpoint.mockGet
        let mockNetworkAccess = PTVMockNetworkAccess(dataResponse: nil,
                                                     failureResponse: nil,
                                                     httpStatus: 404)
        apiAccess = PTVAPIAccess(configuration: mockEnvironment.configuration,
                                 networkAccess: mockNetworkAccess)

        do {
            let response: MockDecodable = try await apiAccess.response(for: endpoint, parameters: nil)
            XCTFail("This function should throw an error, returned response: \(response)")
        } catch let error as MockNetworkAccessError {
            XCTAssert(error.localizedDescription == "No data or failure responses were provided",
                      "Unexpected error description: \(error.localizedDescription)")
        } catch {
            XCTFail("Returned unexpected error: \(type(of: error)) -> \(error.self) \(error.localizedDescription)")
        }
    }
}
