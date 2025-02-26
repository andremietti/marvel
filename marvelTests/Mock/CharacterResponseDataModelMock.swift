//
//  CharacterResponseDataModelMock.swift
//  marvelTests
//
//  Created by andre mietti on 08/12/21.
//

import Foundation
@testable import marvel

extension CharacterResponseDataModel {

    static func makeFake() -> CharacterResponseDataModel {
        return CharacterResponseDataModel(chatacter: CharacterResponse.makeFake())
    }
}
