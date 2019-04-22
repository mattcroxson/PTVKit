//
//  PTVMockDataService.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation
@testable import PTVKit

internal final class PTVMockDataService {

    // MARK: - Properties

    let mockEnvironment: PTVAPIEnvironment

    // MARK - PTVMockDataService
    
    init() {
        class MockProvider: PTVAPIConfigurationProvider {
            let apiUserId = "MOCK_USER"
            let apiKey = "MOCK_KEY"
        }
        let mockConfiguration = MockProvider()
        self.mockEnvironment = PTVAPIEnvironment(configuration: mockConfiguration)
    }
}
