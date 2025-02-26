//
//  CharacterDataResponseMock.swift
//  marvelTests
//
//  Created by andre mietti on 08/12/21.
//

import Foundation
@testable import marvel

extension CharacterDataResponse {
    static func makeFake() -> CharacterDataResponse {
        return CharacterDataResponse(code: 200,
                                     status: "Ok",
                                     copyright: nil,
                                     attributionText: nil,
                                     attributionHTML: nil,
                                     etag: nil,
                                     data: CharactersResponse.makeFake())
    }
}
