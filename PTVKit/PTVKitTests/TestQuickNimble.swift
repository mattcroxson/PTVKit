//
//  TestQuickNimble.swift
//  PTVKitTests
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PTVKit

public final class TestQuickNimbleSpec: QuickSpec {
    public override func spec() {
        describe("TestQuickNimble") {
            expect(true).to(beTrue())
        }
    }
}
