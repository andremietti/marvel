//
//  MainRetrieveCharactersUseCaseSpy.swift
//  marvelTests
//
//  Created by andre mietti on 06/09/21.
//

import Foundation
@testable import marvel

class MainRetrieveCharactersUseCaseSpy {

    var service: MainServiceProtocolSpy?
    var retrieveMarvelCharactersCalled = 0

    init(service: MainServiceProtocolSpy) {
        self.service = service
    }
}

extension MainRetrieveCharactersUseCaseSpy: MainRetrieveCharactersUseCaseProtocol {
    func execute(offset: Int64, completion: @escaping GenericResult<CharacterDataResponse>) {
        retrieveMarvelCharactersCalled += 1
        service?.retrieveMarvelCharacters(offset: 0, completion: completion)
    }
}
