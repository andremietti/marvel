//
//  Localize.swift
//  marvel
//
//  Created by andre mietti on 04/12/21.
//

import Foundation

// MARK: - Representable Protocols
protocol LocalizeRepresentable: RawRepresentable {
    var localized: String { get }
}

// MARK: - Representable Protocols Extensions
extension LocalizeRepresentable where RawValue == String {
    var localized: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}
