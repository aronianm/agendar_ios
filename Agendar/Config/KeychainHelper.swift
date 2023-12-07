//
//  KeychainHelper.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import Foundation
class KeychainHelper {
    static func saveToken(token: String, key: String) {
        if let data = token.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]

            SecItemDelete(query as CFDictionary)
            SecItemAdd(query as CFDictionary, nil)
        }
    }

    static func getToken(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var data: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &data)

        if status == errSecSuccess, let tokenData = data as? Data, let token = String(data: tokenData, encoding: .utf8) {
            return token
        } else {
            return nil
        }
    }

    static func deleteToken(key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        SecItemDelete(query as CFDictionary)
    }
}
