//
//  NetworkServiceProvider.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation

/// A type that can support serviecs for news listing and photo services.
///
/// `NewsServiceProvider` is a type alias for the `SearchNewsArticleRepository` and `PhotoRepositoryService` protocols.
/// When you use `NewsServiceProvider` as a type or a generic constraint, it matches
/// any type that conforms to both protocols.
typealias NewsServiceProvider = SearchNewsArticleRepository & PhotoRepositoryService
