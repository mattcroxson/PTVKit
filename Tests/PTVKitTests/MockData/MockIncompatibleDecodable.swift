//
//  MockIncompatibleDecodable.swift
//  MockIncompatibleDecodable
//
//  Created by Matt Croxson on 4/9/21.
//  Copyright © 2021 Matt Croxson. All rights reserved.
//

import Foundation

struct MockIncompatibleDecodable: Codable, DataRepresentable {
    let incompatibleValue: Int

    init(incompatibleValue: Int) {
        self.incompatibleValue = incompatibleValue
    }
}
