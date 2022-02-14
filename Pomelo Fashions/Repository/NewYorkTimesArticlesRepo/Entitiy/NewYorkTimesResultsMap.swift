//
//  NewYorkTimesResultsMap.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation

extension NYTimesResult {
    /// Mapping `NYTimesItemt` list to `NewsListItem` list view model
    func toNewsListItem() -> [NewsListItem] {
        return result.compactMap(NewsListItem.init)
    }
}

extension NewsListItem {
    /// helper init to convert model into `NewsListItem`
    /// - Parameter newsItem: `NYTimesItem` codable model search arcticle api.
    fileprivate init(newsItem: NYTimesItem) {
        let emptyValue = "-"
        headline = newsItem.headline.isEmpty ? emptyValue : newsItem.headline
        description = newsItem.description
        imageURL = newsItem.imageURL
        webURL = newsItem.webURL
        if let date = newsItem.publishDate {
            publishDate = DateFormatter.displayDate.string(from: date)
        } else {
            publishDate = emptyValue
        }
    }
}

extension DateFormatter {
    static let displayDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.calendar = Calendar.current
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter
    }()
}
