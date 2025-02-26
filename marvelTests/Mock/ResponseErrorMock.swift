//
//  ResponseErrorMock.swift
//  marvelTests
//
//  Created by andre mietti on 08/12/21.
//

import Foundation
@testable import marvel

extension ResponseError {
    
    static func makeFake() -> ResponseError {
        return ResponseError(title: "Error mock", message: "Message mock")
    }
}
