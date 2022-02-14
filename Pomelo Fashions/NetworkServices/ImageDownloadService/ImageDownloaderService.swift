//
//  ImageDownloaderService.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//
import Foundation

final class ImageDownloaderService {
    private let config: NetworkConfigurable
    private let networkSession: NetworkSession
    var imageDownloadOperation = OperationQueue()
    init(config: NetworkConfigurable, networkSession: NetworkSession) {
        self.config = config
        self.networkSession = networkSession
    }

    deinit {
        imageDownloadOperation.cancelAllOperations()
    }
}

extension ImageDownloaderService: NetworkService {
    /// Check for existing `ImageOperation` for url
    /// - Parameter imageUrl: url to validate for existing operation
    private func getImageOperation(imageUrl: URL) -> ImageOperation? {
        let operations = (imageDownloadOperation.operations as? [ImageOperation])?.filter { $0.imageUrl.absoluteString == imageUrl.absoluteString && $0.isFinished == false && $0.isExecuting == true }
        return operations?.first
    }

    func request(endpoint: APIEndPoint,
                 completion: @escaping CompletionHandler) -> NetworkCancellable? {
        do {
            let imageUrl = try endpoint.url(with: config)

            // validating existing image operations.
            if let operation = getImageOperation(imageUrl: imageUrl) {
                operation.queuePriority = .high
                return nil
            }

            let downloadOperation = ImageOperation(imageUrl: imageUrl, urlSession: networkSession)

            downloadOperation.downloadHandler = { data, error in

                if let resultError = error {
                    completion(.failure(.generic(resultError)))
                    return
                }
                completion(.success(data))
            }
            imageDownloadOperation.addOperation(downloadOperation)
        } catch {
            completion(.failure(.urlGeneration))
        }
        return nil
    }
}

