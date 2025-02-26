//
//  MainViewModel.swift
//  Marvel
//
//  Created by andre mietti on 15/05/21.
//

import Foundation

protocol MainViewModelInput {
    func getCharacters()
    func showCharacterDetail(character: CharacterResponseDataModel)
}

protocol MainViewModelOutput {
    var showLoading: Observable<Bool> { get }
    var showError: Observable<(title: String, message: String)> { get }
    var setMarvelCollectionView: Observable<[CharacterResponseDataModel]> { get }
    var setMarvelTableView: Observable<[CharacterResponseDataModel]> { get }
}

protocol MainViewModelCoordinating {
    func showDetailScene(character: CharacterResponseDataModel)
    func closeScene()
}

protocol MainViewModelProtocol: MainViewModelInput, MainViewModelOutput {}

class MainViewModel: MainViewModelProtocol {

    private let coordinator: MainViewModelCoordinating
    private let useCase: MainRetrieveCharactersUseCaseProtocol
    private var characters: CharactersDataModel?
    private var offset: Int64 = 0
    private var isLoading: Bool = false

    var showLoading: Observable<Bool> = Observable()
    var showError: Observable<(title: String, message: String)> = Observable()
    var setMarvelCollectionView: Observable<[CharacterResponseDataModel]> = Observable()
    var setMarvelTableView: Observable<[CharacterResponseDataModel]> = Observable()

    init(useCase: MainRetrieveCharactersUseCaseProtocol, coordinator: MainViewModelCoordinating) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

    // MARK: - MainViewModelInput
    func getCharacters() {
        if !isLoading {
            isLoading = true
            showLoading.onNext(true)
            useCase.execute(offset: offset) { result in

                self.isLoading = false
                self.showLoading.onNext(false)

                switch result {
                case .success(let response):
                    guard let responseData = response.data else { return }
                    self.setOffset(responseData: responseData)
                    self.prepareMarvelCollectionViewContent()
                    self.prepareMarvelTableViewContent()
                case .failure(let error):
                    self.showError.onNext((error.title, error.message))
                }
            }
        }
    }

    func showCharacterDetail(character: CharacterResponseDataModel) {
        coordinator.showDetailScene(character: character)
    }

    func closeScene() {
        coordinator.closeScene()
    }

    // MARK: - Funcional methods
    private func setOffset(responseData: CharactersResponse) {
        guard let currentPage = responseData.offset else {
            offset = 0
            return
        }
        if currentPage > 0 {
            preparePaginationContent(data: responseData)
            offset += Int64(responseData.limit.defaultValue)
            return
        }

        offset += Int64(responseData.limit.defaultValue)
        characters = CharactersDataModel(character: responseData)
    } 

    private func preparePaginationContent(data: CharactersResponse) {
        let dataModel = CharactersDataModel(character: data)
        characters?.results?.append(contentsOf: dataModel.results ?? .defaultValue)
        let uniques = removeDuplicateElements(dataModel: characters?.results ?? .defaultValue)
        characters?.results = uniques
        prepareMarvelTableViewContent()
    }

    private func prepareMarvelCollectionViewContent() {
        guard let results = characters?.results, !results.isEmpty else { return }
        guard let sliceArray = characters?.results?[0..<5] else { return }
        var fiveStarItems = [CharacterResponseDataModel]()
        fiveStarItems.append(contentsOf: sliceArray)
        setMarvelCollectionView.onNext(fiveStarItems)
    }

    private func prepareMarvelTableViewContent() {
        guard let result = characters?.results, !result.isEmpty else { return }
        guard let sliceArray = characters?.results?[5..<result.count] else { return }
        var listItems = [CharacterResponseDataModel]()
        listItems.append(contentsOf: sliceArray)
        setMarvelTableView.onNext(listItems)
    }

    private func removeDuplicateElements(dataModel: [CharacterResponseDataModel]) -> [CharacterResponseDataModel] {
        var uniqueModels = [CharacterResponseDataModel]()
        for data in dataModel {
            if !uniqueModels.contains(where: {$0.id == data.id }) {
                uniqueModels.append(data)
            }
        }
        return uniqueModels
    }
    
}
