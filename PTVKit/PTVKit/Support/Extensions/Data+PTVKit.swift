//
//  Data+PTVKit.swift
//  PTVKit
//
//  Created by Matt Croxson on 15/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

extension Data {
    private static let hexAlphabet = "0123456789ABCDEF".unicodeScalars.map { $0 }

    internal var hexEncodedString: String {
        return String(self.reduce(into: "".unicodeScalars, { (result, value) in
            result.append(Data.hexAlphabet[Int(value/16)])
            result.append(Data.hexAlphabet[Int(value%16)])
        }))
    }

    internal var hexString: String {
        guard let hexData = String(data: self, encoding: .utf8) else { return "" }
        return hexData
    }
}
