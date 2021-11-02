//
//  MainFactoryImplementation.swift
//  Marvel
//
//  Created by andre mietti on 15/05/21.
//

import Swinject

class MainFactoryImplementation: DependencyProtocol {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

//MARK: Implement MainFactory
extension MainFactoryImplementation: MainFactory {

    func makeMainViewController() -> MainViewController {
        let viewModel = resolver.resolveSafe(MainViewModelProtocol.self)
        return MainViewController(viewModel: viewModel)
    }

    func makeDetailViewController(character: CharacterResponseDataModel) -> DetailViewController {
        let viewModel = resolver.resolveSafe(DetailViewModelProtocol.self, argument: character)
        return DetailViewController(viewModel: viewModel)
    }
}

