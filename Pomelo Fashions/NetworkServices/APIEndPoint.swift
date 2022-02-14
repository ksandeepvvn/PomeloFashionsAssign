//
//  APIEndPoint.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

/// `APIEndPoint` is a protocol  type  define for request parameters.
///
/// It creates valid `URLRequest` using `NetworkConfigurable`.
/// It uses path, query header etc. parameters for creating `URLRequest`
protocol APIEndPoint {
    var path: String { get }
    var isFullPath: Bool { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: Any] { get }
    var headerParamaters: [String: String] { get }
    func urlRequest(_ config: NetworkConfigurable) throws -> URLRequest
}

enum RequestGenerationError: Error {
    case components
}

extension APIEndPoint {
    func url(with config: NetworkConfigurable) throws -> URL {
        let baseURL = config.baseURL.absoluteString.last != "/" ? config.baseURL.absoluteString + "/" : config.baseURL.absoluteString
        let endpoint = isFullPath ? path : baseURL.appending(path)

        guard var urlComponents = URLComponents(string: endpoint) else { throw RequestGenerationError.components }
        var urlQueryItems = [URLQueryItem]()

        queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        config.queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
        guard let url = urlComponents.url else { throw RequestGenerationError.components }
        return url
    }

    func urlRequest(_ config: NetworkConfigurable) throws -> URLRequest {
        let url = try self.url(with: config)
        var urlRequest = URLRequest(url: url)
        var allHeaders: [String: String] = config.headers
        headerParamaters.forEach { allHeaders.updateValue($1, forKey: $0) }

        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = allHeaders
        return urlRequest
    }
}

/// Helper model to implement `APIEndPoint`
struct APIEndPointProvider: APIEndPoint {
    var path: String
    var isFullPath: Bool
    var method: HTTPMethod
    var queryParameters: [String: Any]
    var headerParamaters: [String: String]

    init(path: String,
         isFullPath: Bool = false,
         method: HTTPMethod = .GET,
         queryParameters: [String: Any] = [:],
         headerParamaters: [String: String] = [:]) {
        self.path = path
        self.isFullPath = isFullPath
        self.method = method
        self.queryParameters = queryParameters
        self.headerParamaters = headerParamaters
    }
}
