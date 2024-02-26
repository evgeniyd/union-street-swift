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
        let sut = makeSUT()
        XCTAssertNotNil(sut)
    }

    func test_find_singleNodeReturnsNodeItselfOnInit() {
        let sut = makeSUT(1)
        XCTAssertEqual(0, sut.find(0))
    }

    func test_union_returnsFalseOnUnionWithItself() {
        var sut = makeSUT(1)
        XCTAssertEqual(false, sut.union(0,0))
    }

    func test_find_returnsNodesItselfOnTwoNodesInit() {
        let sut = makeSUT(2)
        XCTAssertEqual(0, sut.find(0))
        XCTAssertEqual(1, sut.find(1))
    }

    func test_union_returnsTrueOnUnionOfTwoNodesOnce() {
        var sut = makeSUT(2)
        XCTAssertEqual(true, sut.union(0,1))
    }

    func test_union_returnsFalseOnUnionOfTwoNodesTwice() {
        var sut = makeSUT(2)

        sut.union(0,1)

        XCTAssertEqual(false, sut.union(0,1))
    }

    func test_union_returnsTrueOnUnionOfMultipleNodes() {
        let input = [0,1,2,3,4,5]
        var sut = makeSUT(input.count)
        let parent = input.first!

        for num in input where num != parent {
            XCTAssertEqual(true, sut.union(parent,num))
        }
    }

    func test_find_returnsSameParentOnMultipleNodesUnion() {
        let input = [0,1,2,3,4,5]
        var sut = makeSUT(input.count)
        let parent = input.first!

        for num in input {
            sut.union(parent,num)
        }

        for num in input {
            let receivedParent = sut.find(num)
            let expectedParent = parent
            XCTAssertEqual(receivedParent, expectedParent)
        }
    }

    func test_union_returnsTrueOnUnionOfMultipleNodesWithArbitraryUniqueValues() {
        let input = [6,3,4,1,5,0]
        var sut = makeSUT(input.max()!+1)
        let parent = input.first!

        var expectedReturnValues = [false, true, true, true, true, true]

        var receivedReturnValues: [Bool] = []
        for num in input {
            receivedReturnValues.append(sut.union(parent,num))
        }

        XCTAssertEqual(expectedReturnValues, receivedReturnValues, "Expecting \(expectedReturnValues), received \(receivedReturnValues)  instead")
    }

    func test_union_returnsTrueOnUnionOfMultipleNodesWithArbitraryValuesWithDuplicates() {
        let input = [6,3,1,1,5,0]
        var sut = makeSUT(input.max()!+1)
        let parent = input.first!

        var expectedReturnValues = [false, true, true, false, true, true]

        var receivedReturnValues: [Bool] = []
        for num in input {
            receivedReturnValues.append(sut.union(parent,num))
        }

        XCTAssertEqual(expectedReturnValues, receivedReturnValues, "Expecting \(expectedReturnValues), received \(receivedReturnValues)  instead")
    }

    func test_find_returnsSameParentOnUnionOfMultipleNodesWithArbitraryUniqueValues() {
        let input = [6,3,4,1,5,0]
        var sut = makeSUT(input.max()!+1)
        let parent = input.first!

        for num in input {
            sut.union(parent,num)
        }

        for num in input {
            let receivedParent = sut.find(num)
            let expectedParent = parent
            XCTAssertEqual(receivedParent, expectedParent)
        }
    }

    func test_find_returnsSameParentOnUnionOfMultipleNodesWithArbitraryValuesWithDuplicates() {
        let input = [6,3,1,1,5,0]
        var sut = makeSUT(input.max()!+1)
        let parent = input.first!

        for num in input {
            sut.union(parent,num)
        }

        for num in input {
            let receivedParent = sut.find(num)
            let expectedParent = parent
            XCTAssertEqual(receivedParent, expectedParent)
        }
    }

    // MARK: Helpers

    private func makeSUT(_ count: Int = 0) -> UnionFind {
        return UnionFind(count)
    }
}
