//
//  UnionStreetTests.swift
//  UnionStreetTests
//
//  Created by Yevhen Dubinin on 2/26/24.
//

import XCTest
@testable import UnionStreet

final class UnionStreetTests: XCTestCase {

    func test_init_returnsNotNil() {
        let uf = makeSUT()
        XCTAssertNotNil(uf)
    }

    // MARK: Helpers

    private func makeSUT() -> UnionFind {
        return UnionFind()
    }
}
