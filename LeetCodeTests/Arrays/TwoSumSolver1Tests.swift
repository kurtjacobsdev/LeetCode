//
//  TwoSumSolver1.swift
//  LeetCodeTests
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import XCTest
@testable import LeetCode

final class TwoSumSolver1Tests: XCTestCase {

    private let testCases: [(input: (list: [Int], target: Int), answer: [Int])] = [
        (([2,7,11,15], 9), [0,1]),
        (([3,2,4], 6), [1,2]),
        (([3,3], 6), [0,1]),
    ]

    private var solver = TwoSumSolver1()

    func testAlgorithm1() throws {
        for testCase in testCases {
            let result = solver.solve(testCase.input.list, testCase.input.target, .linear)
            XCTAssertEqual(result.sorted(), testCase.answer)
        }
    }

    func testAlgorithm2() throws {
        for testCase in testCases {
            let result = solver.solve(testCase.input.list, testCase.input.target, .quadratic)
            XCTAssertEqual(result.sorted(), testCase.answer)
        }
    }
}
