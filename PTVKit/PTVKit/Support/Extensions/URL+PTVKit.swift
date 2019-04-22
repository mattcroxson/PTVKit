//
//  URL+PTVKit.swift
//  PTVKit
//
//  Created by Matt Croxson on 22/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation
import CommonCrypto

extension URL {
    
    internal func signature(using configuration: PTVAPIConfigurationProvider) -> String? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }

        let pathQuery = components.pathWithQuery
        let pathQueryData = pathQuery.cString(using: .utf8)

        let key = configuration.apiKey
        let keyData = key.cString(using: .utf8)

        guard let pathQueryString = pathQueryData, let keyString = keyData else { return nil }

        let pathQueryLength = strlen(pathQueryString)
        let keyLength = strlen(keyString)
        let digestLength = Int(CC_SHA1_DIGEST_LENGTH)

        var result = [CUnsignedChar](repeating: 0, count: digestLength)

        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1),
               keyString,
               keyLength,
               pathQueryString,
               pathQueryLength,
               &result)
        let hmacData = Data(bytes: result, count: digestLength)
        let hmacString = hmacData.hexEncodedString

        return hmacString
    }

    internal func signed(using configuration: PTVAPIConfigurationProvider) -> URL? {

        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let devIdQueryItem = URLQueryItem(name: "devid", value: configuration.apiUserId)

        if components?.queryItems == nil {
            components?.queryItems = [devIdQueryItem]
        } else {
            components?.queryItems?.append(devIdQueryItem)
        }

        let querySignature = signature(using: configuration)
        let signatureQueryItem = URLQueryItem(name: "signature", value: querySignature)

        components?.queryItems?.append(signatureQueryItem)
        return components?.url
    }
}
