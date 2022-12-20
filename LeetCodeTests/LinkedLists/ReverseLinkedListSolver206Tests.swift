//
//  reverse_linked_list_tests.swift
//  LeetCodeTests
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import XCTest
@testable import LeetCode

final class ReverseLinkedListSolver206Tests: XCTestCase {

    private let testCases: [(input: ListNode?, answer: ListNode?)] = [
        ([1,2,3,4,5].linkedList(), [5,4,3,2,1].linkedList()),
        ([1,2].linkedList(), [2,1].linkedList()),
        ([1,2,3,4,5,6,7,8,9,10,11].linkedList(), [11,10,9,8,7,6,5,4,3,2,1].linkedList()),
        ([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].linkedList(), [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1].linkedList()),
    ]
    private var solver = ReverseLinkedListSolver206()

    // MARK: Tests
    func testReverseLinkedListSolverStack() throws {
        for testCase in testCases {
            let result = try solver.reverseList(testCase.input, algorithm: .stack)
            AssertLinkedLists(lhs: result, rhs: testCase.answer)
        }
    }

    func testReverseLinkedListSolverPointers() throws {
        for testCase in testCases {
            let result = try solver.reverseList(testCase.input, algorithm: .pointers)
            AssertLinkedLists(lhs: result, rhs: testCase.answer)
        }
    }

    func testReverseLinkedListSolverRecursive() throws {
        for testCase in testCases {
            let result = try solver.reverseList(testCase.input, algorithm: .recursive)
            AssertLinkedLists(lhs: result, rhs: testCase.answer)
        }
    }

    // MARK: Assertions
    private func AssertLinkedLists(lhs: ListNode?, rhs: ListNode?) {
        var lhs = lhs
        var rhs = rhs
        while(lhs != nil && rhs != nil) {
            XCTAssertEqual(lhs?.val, rhs?.val)
            lhs = lhs?.next
            rhs = rhs?.next
        }
    }
}

private extension Array where Element == Int {
    func linkedList() -> ListNode? {
        var head: ListNode?
        var current: ListNode?
        for element in self {
            if head == nil {
                head = ListNode(element)
                current = head
            } else {
                current?.next = ListNode(element)
                current = current?.next
            }
        }
        return head
    }
}
