//
//  NetworkService.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation

protocol NetworkCancellable {
    func cancel()
}

extension URLSessionTask: NetworkCancellable {}

protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
    func request(endpoint: APIEndPoint,
                 completion: @escaping CompletionHandler) -> NetworkCancellable?
}

protocol NetworkSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    func request(_ request: URLRequest,
                 completion: @escaping CompletionHandler) -> NetworkCancellable
}
