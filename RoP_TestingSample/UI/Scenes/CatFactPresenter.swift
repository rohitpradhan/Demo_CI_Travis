//
//  CatFactPresenter.swift
//  RoP_TestingSample
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation

protocol CatFactView: class {
    func setNewFact(text: String)
}

protocol CatFactPresenter {
    var router: CatFactViewRouter { get }

    func viewDidLoad()
    func getNewFact()
}

class CatFactPresenterImplementation: CatFactPresenter {
    fileprivate weak var view: CatFactView?
    private(set) var router: CatFactViewRouter
    private(set) var useCase: CatFactUseCase


    init(view: CatFactView,
         router: CatFactViewRouter, useCase: CatFactUseCase) {
        self.view = view
        self.router = router
        self.useCase = useCase
    }

    func viewDidLoad() {
        getCatFact()
    }

    private func getCatFact() {
        useCase.getCatFact { [weak self] (result) in
            switch result {
                case .success(let reponse):
                    self?.view?.setNewFact(text: reponse.fact ?? "")
                case .failure(let error):
                    print("\(error)")
            }
        }
    }

    func getNewFact() {
        getCatFact()
    }

}

