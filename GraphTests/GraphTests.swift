//
//  GraphTests.swift
//  GraphTests
//
//  Created by Gulya Boiko on 8/6/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import XCTest
@testable import Graph

final class GraphTests: XCTestCase {
    
    func test_tarjan() {
        let adjacencyMatrix = [
            [5],
            [0, 2, 4, 6],
            [6],
            [6, 7],
            [],
            [2],
            [3, 7],
            []
        ]
        var sut = Tarjan().run(adjacencyMatrix: adjacencyMatrix)
        XCTAssert(sut?.pop() == 1)
        XCTAssert(sut?.pop() == 4)
        XCTAssert(sut?.pop() == 0)
        XCTAssert(sut?.pop() == 5)
        XCTAssert(sut?.pop() == 2)
        XCTAssert(sut?.pop() == 6)
        XCTAssert(sut?.pop() == 3)
        XCTAssert(sut?.pop() == 7)
    }

    func test_demucrone() {
        let adjacencyVector: [[Int]] = [
            [2, 12],
            [12],
            [],
            [2],
            [2, 8, 9],
            [3, 10, 11, 12],
            [10],
            [1, 3, 5, 6],
            [0, 13],
            [0, 6, 11],
            [2],
            [],
            [2],
            [5]
        ]
        let result = try? DemucronAlgorithm().run(adjacencyVector: adjacencyVector)
        XCTAssert(result?[0].sorted() == [4, 7])
        XCTAssert(result?[1].sorted() == [1, 8, 9])
        XCTAssert(result?[2].sorted() == [0, 6, 13])
        XCTAssert(result?[3].sorted() == [5])
        XCTAssert(result?[4].sorted() == [3, 10, 11, 12])
        XCTAssert(result?[5].sorted() == [2])
    }

}
