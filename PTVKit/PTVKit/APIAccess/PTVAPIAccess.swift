//
//  PTVAPIAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation
import CommonCrypto

public class PTVAPIAccess {
    let environment: PTVAPIEnvironment

    public init(configuration: PTVAPIConfigurationProvider) {
        self.environment = PTVAPIEnvironment(configuration: configuration)
    }

    internal func signature(for url: URL?) -> String? {
        guard let url = url,
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return nil }

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

    internal func signedUrl(from url: URL?) -> URL? {

        guard let url = url else { return nil }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let devIdQueryItem = URLQueryItem(name: "devid", value: environment.configuration.apiUserId)

        if components?.queryItems == nil {
            components?.queryItems = [devIdQueryItem]
        } else {
            components?.queryItems?.append(devIdQueryItem)
        }

        let querySignature = signature(for: components?.url)
        let signatureQueryItem = URLQueryItem(name: "signature", value: querySignature)

        components?.queryItems?.append(signatureQueryItem)
        return components?.url
    }
}
