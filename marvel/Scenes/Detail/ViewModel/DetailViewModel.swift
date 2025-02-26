//
//  
//  DetailViewModel.swift
//  marvel
//
//  Created by andre mietti on 22/10/21.
//
//
import Foundation

// MARK: - Protocols
protocol DetailViewModelInput {
    func loadContent()
}

protocol DetailViewModelOutput {
    var showLoading: Observable<Bool> { get }
    var showError: Observable<(title: String, message: String)> { get }
    var setName: Observable<String> { get }
    var setDescription: Observable<String> { get }
    var setImage: Observable<URL> { get }
}

protocol DetailViewModelProtocol: DetailViewModelInput, DetailViewModelOutput {}

class DetailViewModel: DetailViewModelProtocol {
    var showLoading: Observable<Bool> = Observable()
    var showError: Observable<(title: String, message: String)> = Observable()
    var setName: Observable<String> = Observable()
    var setDescription: Observable<String> = Observable()
    var setImage: Observable<URL> = Observable()

    var character: CharacterResponseDataModel?

    // MARK: - Setup
    init(character: CharacterResponseDataModel) {
        self.character = character
    }

    func loadContent() {
        setName.onNext(character?.name ?? EmptyStateLocalize.descriptionNotFound.rawValue)
        setDescription.onNext(character?.characterDescription ?? EmptyStateLocalize.descriptionNotFound.rawValue)
        guard let url = character?.thumbnail?.thumbnailUrl else { return }
        setImage.onNext(url)
    }
}
