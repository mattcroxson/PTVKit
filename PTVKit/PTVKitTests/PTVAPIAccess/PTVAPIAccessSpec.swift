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

            it("should generate correct signature") {
                expect(apiAccess.signature(for: URL(string: "localhost"))).to(equal("MOCK_KEYMOCK_USER"))
            }
        }
    }
}
