//
//  DetailFlowAssembly.swift
//  marvel
//
//  Created by andre mietti on 23/10/21.
//

import Swinject

class DetailFlowAssembly: Assembly {

    // MARK: - Assemble
    func assemble(container: Container) {
//        registerDetailFactory(container)

//        let coordinator = container.resolveSafe(DetailCoordinator.self)
//        registerDetailViewModel(container, coordinator)
    }

    // MARK: - Register mambers
//    private func registerDetailFactory(_ container: Container) {
//        container.register(DetailFactory.self) { resolver in
//            DetailFactoryImplementation(resolver: resolver)
//        }
//    }

//    private func registerDetailViewModel(_ container: Container, _ coordinator: DetailCoordinator) {
//        container.register(DetailViewModelCoordinating.self) { _ in coordinator }
//        container.register(DetailViewModelProtocol.self) { (resolver: Resolver) in
//            let viewModel = DetailViewModel(coordinator: coordinator)
//            return viewModel
//        }
//    }
}
