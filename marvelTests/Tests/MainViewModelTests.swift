//
//  MainViewModelTests.swift
//  marvelTests
//
//  Created by andre mietti on 06/09/21.
//

import XCTest
@testable import marvel

class MainViewModelTests: XCTestCase {

    var coordinatorSpy: MainCoordinatorSpy!
    var useCaseSpy: MainRetrieveCharactersUseCaseSpy!
    var sut: MainViewModel!
    var service: MainServiceProtocolSpy!
    var responseData: CharacterResponseDataModel!

    override func setUp() {
        service = MainServiceProtocolSpy()
        useCaseSpy = MainRetrieveCharactersUseCaseSpy(service: service)
        coordinatorSpy = MainCoordinatorSpy()
        sut = MainViewModel(useCase: useCaseSpy, coordinator: coordinatorSpy)
        responseData = CharacterResponseDataModel(chatacter: service.makeCharacterResponse())
    }

    func testIfGetCharactersISCalled() {
        //when
        sut.getCharacters()
        //then
        XCTAssertTrue(useCaseSpy.retrieveMarvelCharactersCalled > 0)
    }

    func testIfShowDetailSceneIsCalled() {
        //when
        sut.showCharacterDetail(character: responseData)
        //then
        XCTAssertTrue(coordinatorSpy.showDetailSceneCalled > 0)
    }

    func testIfCloseSceneIsCalled() {
        //when
        sut.closeScene()
        //then
        XCTAssertTrue(coordinatorSpy.sceneClosedCalled > 0)
    }

    override func tearDown() {
        service = nil
        useCaseSpy = nil
        coordinatorSpy = nil
        sut = nil
    }

}
