//
//  ViewResuableIdentifier.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import Foundation
/// Reusable view identifier protocol.
///
/// `ViewReusableIdentifier` provide default implementation for `reusableIdentifier`.
protocol ViewReusableIdentifier: class {
    static var reusableIdentifier: String { get }
}

extension ViewReusableIdentifier {
    /// Reusable Identifier value for a view.
    static var reusableIdentifier: String {
        return NSStringFromClass(self)
    }
}
