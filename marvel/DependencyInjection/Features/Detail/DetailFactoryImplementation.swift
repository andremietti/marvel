//
//  DetailFactoryImplementation.swift
//  marvel
//
//  Created by andre mietti on 23/10/21.
//

import Swinject

class DetailFactoryImplementation: DependencyProtocol {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

// MARK: - Implement DetailFactory
extension DetailFactoryImplementation: DetailFactory {

    func makeDetailViewController() -> DetailViewController {
        let viewModel = resolver.resolveSafe(DetailViewModelProtocol.self)
        return DetailViewController(viewModel: viewModel)
    }
}
