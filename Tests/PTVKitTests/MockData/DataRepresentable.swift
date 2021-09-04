//
//  DataRepresentable.swift
//  DataRepresentable
//
//  Created by Matt Croxson on 4/9/21.
//  Copyright © 2021 Matt Croxson. All rights reserved.
//

import Foundation

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
