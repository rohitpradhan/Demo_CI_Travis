//
//  CatFactsUseCase.swift
//  RoP_TestingSample
//
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation

typealias Result<T> = Swift.Result<T, Error>

struct Fact: Codable {
    var fact: String?
    var lenght: Int?
}

typealias CatFactUseCaseCompletionHandler = (_ books: Result<Fact>) -> Void

protocol CatFactUseCase {
    func getCatFact(completionHandler: @escaping CatFactUseCaseCompletionHandler)
}

class CatFactUseCaseImplementation: CatFactUseCase {
    let repository: CatFactReositoryProtocol

    init(repository: CatFactReositoryProtocol) {
        self.repository = repository
    }

    // MARK: - DeleteBookUseCase
    func getCatFact(completionHandler: @escaping CatFactUseCaseCompletionHandler) {
        self.repository.getCatFact { (result) in
            completionHandler(result)
        }
    }

}
