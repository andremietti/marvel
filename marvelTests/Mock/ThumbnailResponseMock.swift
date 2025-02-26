//
//  ThumbnailResponseMock.swift
//  marvelTests
//
//  Created by andre mietti on 08/12/21.
//

import Foundation
@testable import marvel

extension ThumbnailResponse {

    static var thumbnailMock: ThumbnailResponse {
        return ThumbnailResponse(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg")
    }

}
