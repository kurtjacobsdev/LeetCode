//
//  PlusOneSolver66Tests.swift
//  LeetCodeTests
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import XCTest
@testable import LeetCode

final class PlusOneSolver66Tests: XCTestCase {
    private let testCases: [(input: [Int], answer: [Int])] = [
        ([1,2,3], [1,2,4]),
        ([4,3,2,1], [4,3,2,2]),
        ([9], [1,0]),
    ]

    private var solver = PlusOneSolver66()

    func testAlgorithm1() throws {
        for testCase in testCases {
            let result = solver.solve(testCase.input, alogrithm: .copy)
            XCTAssertEqual(result, testCase.answer)
        }
    }

    func testAlgorithm2() throws {
        for testCase in testCases {
            let result = solver.solve(testCase.input, alogrithm: .inplace)
            XCTAssertEqual(result, testCase.answer)
        }
    }
}
