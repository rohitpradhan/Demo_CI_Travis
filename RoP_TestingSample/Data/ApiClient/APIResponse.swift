//
//  APIResponse.swift
//  RoP_TestingSample
//
//  Created by Rohit Pradhan on 09/08/21.
//

import Foundation

struct NetworkRequestError: Error {
    let error: Error?

    var localizedDescription: String {
        return error?.localizedDescription ?? "Network request error - no other information"
    }
}

// Can be thrown when we reach the API but the it returns a 4xx or a 5xx
struct ApiError: Error {
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
}

// Can be thrown by InitializableWithData.init(data: Data?) implementations when parsing the data
struct ApiParseError: Error {
    static let code = 999

    let error: Error
    let httpUrlResponse: HTTPURLResponse
    let data: Data?

    var localizedDescription: String {
        return error.localizedDescription
    }
}

struct ApiResponse<T: Decodable> {
    let entity: T
    let httpUrlResponse: HTTPURLResponse
    let data: Data?

    init(data: Data?, httpUrlResponse: HTTPURLResponse) throws {
        do {
            self.entity = try JSONDecoder().decode(T.self, from: data ?? Data())
            self.httpUrlResponse = httpUrlResponse
            self.data = data
        } catch {
            throw ApiParseError(error: error, httpUrlResponse: httpUrlResponse, data: data)
        }
    }
}

struct VoidResponse: Decodable { }

extension NSError {
    static func createPraseError() -> NSError {
        return NSError(domain: "com.fortech.library",
                       code: ApiParseError.code,
                       userInfo: [NSLocalizedDescriptionKey: "A parsing error occured"])
    }
}
