//
//  Crypto.swift
//  Marvel
//
//  Created by andre mietti on 15/05/21.
//

import Foundation
import CommonCrypto

class Crypto {

    static func getAuthorization(intTs: String) -> String {
        let intTs = intTs
        let privKey = Keys.privateKey.rawValue
        let pubKey = Keys.pubKey.rawValue
        let params = intTs + privKey + pubKey

        return params.md5
    }
}

extension String {
    var md5: String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}
