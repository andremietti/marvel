//
//  CharactersResponseMock.swift
//  marvelTests
//
//  Created by andre mietti on 08/12/21.
//

import Foundation
@testable import marvel

extension CharactersResponse {

    static func makeFake() -> CharactersResponse {
        return CharactersResponse(offset: 0,
                                  limit: 20,
                                  total: 200,
                                  count: 20,
                                  results: CharacterResponse.makeFakeArray())
    }
}
