//
//  APIConstantsWithKeys.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation

enum APIConstantKeys {
    static let imageBaseURL = "https://static01.nyt.com/"
    static let baseURL = "https://api.nytimes.com/"
    static let APIKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
   
}
