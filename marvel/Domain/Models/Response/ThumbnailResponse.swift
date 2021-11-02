//
//  ThumbnailResponse.swift
//  Marvel
//
//  Created by andre mietti on 16/05/21.
//

import Foundation

struct ThumbnailResponse {
    let path: String?
    let thumbnailExtension: String?
}

extension ThumbnailResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

extension ThumbnailResponse {
    var thumbnailUrl: URL? {
        return URL(string: (self.path.defaultValue + "." + self.thumbnailExtension.defaultValue))
    }
}
