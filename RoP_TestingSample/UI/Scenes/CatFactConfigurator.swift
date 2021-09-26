//
//  CatFactConfigurator.swift
//  RoP_TestingSample
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation

protocol CatFactConfigurator {
    func configure(viewController: CatFactViewController)
}

class CatFactConfiguratorImplementation: CatFactConfigurator {
    func configure(viewController: CatFactViewController) {

        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                completionHandlerQueue: OperationQueue.main)
        let repository = CatFactRepository(apiClient: apiClient)
        let getCatFactUseCase = CatFactUseCaseImplementation(repository: repository)
        let router = CatFactViewRouterImplementation(viewController: viewController)
        let presenter = CatFactPresenterImplementation(view: viewController, router: router, useCase: getCatFactUseCase)
        viewController.presenter = presenter
    }
}

