//
//  MainFlowAssembly.swift
//  Marvel
//
//  Created by andre mietti on 15/05/21.
//

import Swinject

class MainFlowAssembly: Assembly {

    //MARK: Assemble
    func assemble(container: Container) {
        registerMainFactory(container)
        registerDetailFactory(container)
        
        let coordinator = container.resolveSafe(MainCoordinator.self)
        registerMainViewModel(container, coordinator)
        registerDetailViewModel(container)
    }

    // MARK: Register members
    private func registerMainFactory(_ container: Container) {
        container.register(MainFactory.self) { resolver in
            MainFactoryImplementation(resolver: resolver)
        }
    }

    private func registerDetailFactory(_ container: Container) {
        container.register(DetailFactory.self) { resolver in
            DetailFactoryImplementation(resolver: resolver)
        }
    }

    private func registerMainViewModel(_ container: Container, _ coordinator: MainCoordinator) {
        container.register(MainViewModelCoordinating.self) { _ in coordinator }
        container.register(MainViewModelProtocol.self) { (resolver: Resolver) in
            let viewModel = MainViewModel(useCase: resolver.resolveSafe(MainRetrieveCharactersUseCaseProtocol.self),
                                          coordinator: coordinator)
            return viewModel
        }
    }

    private func registerDetailViewModel(_ container: Container) {
        container.register(DetailViewModelProtocol.self) { (resolver: Resolver, character: CharacterResponseDataModel) in
            let viewModel = DetailViewModel(character: character)
            return viewModel
        }
    }

}
