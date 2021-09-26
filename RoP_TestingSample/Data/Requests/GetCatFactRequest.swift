//
//  GetCatRequest.swift
//  RoP_TestingSample
//
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation

struct GetCatFactRequest: ApiRequest {

    var urlRequest: URLRequest {
        let url: URL! = URL(string: "https://catfact.ninja/fact")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }

}
