//
//  MainCoordinatorSpy.swift
//  marvelTests
//
//  Created by andre mietti on 06/09/21.
//

import Foundation
@testable import marvel

class MainCoordinatorSpy: MainViewModelCoordinating {

    var sceneClosedCalled = 0
    var showDetailSceneCalled = 0

    func showDetailScene(character: CharacterResponseDataModel) {
        showDetailSceneCalled += 1
    }

    func closeScene() {
        sceneClosedCalled += 1
    }
}
