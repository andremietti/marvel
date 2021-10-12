//
//  MainServiceProtocolSpy.swift
//  marvelTests
//
//  Created by andre mietti on 06/09/21.
//

import Foundation
@testable import marvel

class MainServiceProtocolSpy: MainServiceProtocol {

    var success = true
    let thumbnailPath = "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"
    let thumbnailExtension = "jpg"

    func retrieveMarvelCharacters(offset: Int64, completion: @escaping GenericResult<CharacterDataResponse>) {
        switch success {
        case true:
            completion(.success(makeCharacterDataResponse()))
        case false:
            completion(.failure(makeError()))
        }
    }

    private func makeCharacterDataResponse() -> CharacterDataResponse {
        return CharacterDataResponse(code: 200, status: "Ok", copyright: nil, attributionText: nil, attributionHTML: nil, etag: nil, data: makeCharactersResponse())
    }

    private func makeCharactersResponse() -> CharactersResponse {
        return CharactersResponse(offset: 0, limit: 20, total: 200, count: 20, results: makeCharacterResponse())
    }

    private func makeCharacterResponse() -> [CharacterResponse] {
        var results = [CharacterResponse]()
        for _ in 0...10 {
            results.append(CharacterResponse(id: 2, name: "Mock teste", characterDescription: "Descrição do mock", thumbnail: ThumbnailResponse(path: thumbnailPath, thumbnailExtension: thumbnailExtension)))
        }
        return results
    }

    private func makeError() -> ResponseError {
        return ResponseError(title: "Error mock", message: "Message mock")
    }
}
