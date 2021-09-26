//
//  CatFactRepository.swift
//  RoP_TestingSample
//
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation

class CatFactRepository: CatFactReositoryProtocol {

    let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getCatFact(completionHandler: @escaping CatFactUseCaseCompletionHandler) {
        let getCatFactRequest = GetCatFactRequest()
        apiClient.execute(request: getCatFactRequest) { (result: Result<ApiResponse<Fact>>) in
            switch result {
            case let .success(response):
                let fact = response.entity
                completionHandler(.success(fact))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }

}
