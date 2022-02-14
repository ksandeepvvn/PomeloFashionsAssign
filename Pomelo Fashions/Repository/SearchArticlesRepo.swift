//
//  SearchArticlesRepo.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation

/// Base `SearchNewsArticleRepository` template for loading news list.
protocol SearchNewsArticleRepository {
    @discardableResult
    func searchNewsArticle(query: String,
                           page: Int,
                           completion: @escaping (Result<[NewsListItem], Error>) -> Void) -> Cancellable?
}
