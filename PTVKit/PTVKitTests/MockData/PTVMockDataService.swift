//
//  PTVMockDataService.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation
@testable import PTVKit

public final class PTVMockDataService {

    // MARK: - Singleton

    public static var shared: PTVMockDataService = PTVMockDataService()

    // MARK: - Properties

    public let mockEnvironment: PTVAPIEnvironment
    private let mockConfiguration: PTVAPIConfigurationProvider

    // MARK - PTVMockDataService
    
    private init() {
        class MockProvider: PTVAPIConfigurationProvider {
            let apiUserId = "MOCK_USER"
            let apiKey = "MOCK_KEY"
        }
        self.mockConfiguration = MockProvider()
        self.mockEnvironment = PTVAPIEnvironment(configuration: mockConfiguration)
    }
}
