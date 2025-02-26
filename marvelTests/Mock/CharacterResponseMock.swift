//
//  CharacterResponseMock.swift
//  marvelTests
//
//  Created by andre mietti on 08/12/21.
//

import Foundation
@testable import marvel

extension CharacterResponse {

    static func makeFake() -> CharacterResponse {
        return CharacterResponse(id: 123,
                                 name: "Hulk",
                                 characterDescription: "This is a fake data for tests",
                                 thumbnail: ThumbnailResponse.thumbnailMock)
    }

    static func makeFakeArray() -> [CharacterResponse] {
        var results = [CharacterResponse]()
        for _ in 0...10 {
            results.append(CharacterResponse(id: 2,
                                             name: "Mock teste",
                                             characterDescription: "Descrição do mock",
                                             thumbnail: ThumbnailResponse.thumbnailMock))
        }
        return results
    }
}
