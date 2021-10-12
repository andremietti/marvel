//
//  MainViewModelSpy.swift
//  marvelTests
//
//  Created by andre mietti on 06/09/21.
//

import Foundation
@testable import marvel

class MainViewModelSpy: MainViewModelProtocol {

    var showLoading: Observable<Bool> = Observable()
    var showError: Observable<(title: String, message: String)> = Observable()
    var setMarvelCollectionView: Observable<[CharacterResponseDataModel]> = Observable()
    var setMarvelTableView: Observable<[CharacterResponseDataModel]> = Observable()

    var getCharactersCalled = 0
    var didSelectCharacterCalled = 0
    var closeSceneCalled = 0

    func getCharacters() {
        getCharactersCalled += 1
    }

    func didSelectCharacter() {
        didSelectCharacterCalled += 1
    }

    func closeScene() {
        closeSceneCalled += 1
    }
}
