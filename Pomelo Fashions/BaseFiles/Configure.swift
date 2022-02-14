//
//  Configure.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation
import UIKit

/// Base configurator protocol.
protocol Configurator {
    func build() -> UIViewController
}

/// `NewsListConfigurator`
/// Build dependencies for NewsList screen. through dependency injection.
struct NewsListConfigurator: Configurator {
    private var viewModel: NewsListViewModel
    init() {
        let APIKEY = APIConstantKeys.APIKey.replacingOccurrences(of: "\"", with: "")
        let apiConfig = ApiNetworkConfig(baseURL: URL(string: APIConstantKeys.baseURL)!,
                                         headers: [:],
                                         queryParameters: ["api-key": APIKEY])
        let imageApiConfig = ApiNetworkConfig(baseURL: URL(string: APIConstantKeys.imageBaseURL)!)

        let networkSession = DefaultNetworkHandler(session: URLSession.shared)
        let networkService = DefaultNetworkService(config: apiConfig, networkSession: networkSession)

        let imageService = ImageDownloaderService(config: imageApiConfig, networkSession: networkSession)
        let data = UIImage(named: "placeholder")?.jpegData(compressionQuality: 1.0) ?? Data()
        let newsRepository = NYTimesRepository(newsService: networkService, imageService: imageService, noImageData: data)

        viewModel = NewsListViewModelImpl(newsService: newsRepository)
    }

    /// Return instance of NewListViewController
    func build() -> UIViewController {
        NewsListViewController(viewModel: viewModel)
    }
}
