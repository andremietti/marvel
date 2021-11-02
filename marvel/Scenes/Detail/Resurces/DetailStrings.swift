//
//  DetailStrings.swift
//  marvel
//
//  Created by andre mietti on 01/11/21.
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

enum Localize {
    enum EmptyState: String, LocalizeRepresentable {
        case descriptionNotFound = "No description for this."
    }
}

