//
//  PalindromeNumber9SolverTests.swift
//  LeetCodeTests
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import XCTest
@testable import LeetCode

final class PalindromeNumber9SolverTests: XCTestCase {

    private let testCases: [(input: Int, answer: Bool)] = [
        (121, true),
        (-121, false),
        (10, false),
    ]
    private var solver = PalindromeNumber9Solver()

    // MARK: Tests
    func testPalindromeNumber9SolverStrings() throws {
        for testCase in testCases {
            let result = solver.solve(testCase.input, algorithm: .strings)
            XCTAssertEqual(result, testCase.answer)
        }
    }

    func testPalindromeNumber9SolverInts() throws {
        for testCase in testCases {
            let result = solver.solve(testCase.input, algorithm: .ints)
            XCTAssertEqual(result, testCase.answer)
        }
    }

}
