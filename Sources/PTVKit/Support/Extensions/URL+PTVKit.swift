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

    func signature(environment: PTVAPIEnvironment) -> String? {

        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }

        let pathQuery = components.pathWithQuery
        let pathQueryData = pathQuery.cString(using: .utf8)

        let key = environment.configuration.apiKey
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

    func signedUrl(environment: PTVAPIEnvironment) -> URL? {

        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let devIdQueryItem = URLQueryItem(name: "devid", value: environment.configuration.apiUserId)

        if components?.queryItems == nil {
            components?.queryItems = [devIdQueryItem]
        } else {
            components?.queryItems?.append(devIdQueryItem)
        }

        let querySignature = components?.url?.signature(environment: environment)
        let signatureQueryItem = URLQueryItem(name: "signature", value: querySignature)

        components?.queryItems?.append(signatureQueryItem)
        return components?.url
    }
}
