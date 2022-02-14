//
//  NetworkError.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation

/// `NetowrkError` Error type of enum
///
/// It can be `generic`, `urlGeneration`, specific status/data error case.
enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case generic(Error)
    case urlGeneration
}
