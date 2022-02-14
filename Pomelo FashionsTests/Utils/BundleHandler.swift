//
//  BundleHandler.swift
//  Pomelo FashionsTests
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 11/02/22.
//

import Foundation
import Foundation

private class Maker {}

extension Bundle {
    static let helperBundle = Bundle(for: Maker.self)

    var mockNews: String {
        retriveFile(name: "Mock_News", type: "json")
    }

    private func retriveFile(name: String, type: String) -> String {
        let path = self.path(forResource: name, ofType: type)
        return path ?? ""
    }
}
