//
//  MastgTest.swift
//  MASTestApp
//
//  Created by Charlie on 28.04.24.
//

import SwiftUI

struct MastgTest {
    static func mastgTest(completion: @escaping (String) -> Void) {
        let value = "Random Number: \(Int.random(in: 1...100))"
        completion(value)
    }
}
