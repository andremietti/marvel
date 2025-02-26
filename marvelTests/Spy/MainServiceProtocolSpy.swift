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
        return CharacterDataResponse.makeFake()
    }

    private func makeCharactersResponse() -> CharactersResponse {
        return CharactersResponse.makeFake()
    }

    private func makeCharacterResponse() -> [CharacterResponse] {
        return CharacterResponse.makeFakeArray()
    }

    private func makeError() -> ResponseError {
        return ResponseError.makeFake()
    }

    func makeCharacterResponse() -> CharacterResponse {
        return makeCharacterResponse().first!
    }
}
