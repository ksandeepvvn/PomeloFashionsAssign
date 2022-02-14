//
//  Cancellable.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation
protocol Cancellable {
    func cancel()
}

struct RepositoryTask: Cancellable {
    let networkTask: NetworkCancellable?
    func cancel() {
        networkTask?.cancel()
    }
}
