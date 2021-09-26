//
//  CatFactReositoryProtocol.swift
//  RoP_TestingSample
//
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation

protocol CatFactReositoryProtocol {
    func getCatFact(completionHandler: @escaping CatFactUseCaseCompletionHandler)
}
