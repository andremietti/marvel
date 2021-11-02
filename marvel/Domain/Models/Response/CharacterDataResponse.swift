//
//  CharacterDataResponse.swift
//  Marvel
//
//  Created by andre mietti on 16/05/21.
//

import Foundation

struct CharacterDataResponse {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    var data: CharactersResponse?
}

extension CharacterDataResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case copyright
        case attributionText
        case attributionHTML
        case etag
        case data
    }

}
