//
//  CharactersResponse.swift
//  Marvel
//
//  Created by andre mietti on 16/05/21.
//

import Foundation

struct CharactersResponse {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [CharacterResponse]?
}

extension CharactersResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
}
