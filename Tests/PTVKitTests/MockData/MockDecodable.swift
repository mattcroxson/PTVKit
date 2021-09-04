//
//  MockDecodable.swift
//  MockDecodable
//
//  Created by Matt Croxson on 4/9/21.
//  Copyright © 2021 Matt Croxson. All rights reserved.
//

import Foundation

struct MockDecodable: Codable, DataRepresentable {
    let mockValue: String

    init(mockValue: String) {
        self.mockValue = "mockValue"
    }
}
