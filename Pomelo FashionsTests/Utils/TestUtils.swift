//
//  TestUtils.swift
//  Pomelo FashionsTests
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 11/02/22.
//

import Foundation

extension String {
    func objectFromPath<T: Decodable>(object: T.Type) -> T? {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: self)) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            let resultObject = try decoder.decode(object, from: data)
            return resultObject
        } catch {
            print("parsing error: \(error)")
        }
        return nil
    }
}

