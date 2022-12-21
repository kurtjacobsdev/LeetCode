//
//  RemoveElementSolver27Tests.swift
//  LeetCodeTests
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import XCTest
@testable import LeetCode

final class RemoveElementSolver27Tests: XCTestCase {
    private var testCases: [(input: (list: [Int], value: Int), answer: Int)] = [
        (([3,2,2,3], 3), 2),
        (([0,1,2,2,3,0,4,2], 2), 5),
        (([3,3], 3), 0),
        (([2,2,3], 2), 1),
    ]

    private var solver = RemoveElementSolver27()

    func testAlgorithm1() throws {
        for testCase in testCases {
            var input = testCase.input.list
            let result = solver.solve(input, testCase.input.value, algorithm: .inplace)
            XCTAssertEqual(result, testCase.answer)
        }
    }

    func testAlgorithm2() throws {
        for testCase in testCases {
            var input = testCase.input.list
            let result = solver.solve(input, testCase.input.value, algorithm: .inplace2)
            XCTAssertEqual(result, testCase.answer)
        }
    }

    func testAlgorithm3() throws {
        for testCase in testCases {
            var input = testCase.input.list
            let result = solver.solve(input, testCase.input.value, algorithm: .inplace3)
            XCTAssertEqual(result, testCase.answer)
        }
    }
}
