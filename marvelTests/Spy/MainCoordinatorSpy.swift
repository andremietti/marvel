//
//  MainCoordinatorSpy.swift
//  marvelTests
//
//  Created by andre mietti on 06/09/21.
//

import Foundation
@testable import marvel

class MainCoordinatorSpy: MainCoordinatorDelegate {

    var sceneCLosed = 0
    var coordinatorExit = 0

    func didCloseScene(_ coordinator: Coordinator) {
        sceneCLosed += 1
    }

    func coordinatorDidExit(_ coordinator: Coordinator) {
        coordinatorExit += 1
    }
}
