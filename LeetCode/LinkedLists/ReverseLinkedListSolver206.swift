//
//  ReverseLinkedListSolver.swift
//  LeetCode
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

enum ReverseLinkedListSolver206Algorithm {
    case stack
    case pointers
    case recursive
}

enum ReverseLinkedListSolver206Error: Error {
    case internalError
}

public class ReverseLinkedListSolver206 {
    func reverseList(_ head: ListNode?, algorithm: ReverseLinkedListSolver206Algorithm) throws -> ListNode? {
        switch algorithm {
        case .stack:
            return try algorithm1(head)
        case .pointers:
            return algorithm2(head)
        case .recursive:
            return algorithm3(head)
        }
    }

    /// This algorithm reverses a linked list in O(n) time and space complexity.
    /// - Parameter head: A pointer to the head of the linked list.
    /// - Returns: A pointer to the reversed linked list.
    func algorithm1(_ head: ListNode?) throws -> ListNode? {
        var reversed: ListNode?
        var current: ListNode?
        var head = head
        let stack = Stack()
        while(head != nil) {
            guard let val = head?.val else { throw ReverseLinkedListSolver206Error.internalError}
            stack.push(val)
            head = head?.next
        }

        for _ in 0..<stack.size() {
            if reversed == nil {
                guard let item = stack.pop() else { throw ReverseLinkedListSolver206Error.internalError}
                reversed = ListNode(item)
                current = reversed
            } else {
                guard let item = stack.pop() else { throw ReverseLinkedListSolver206Error.internalError}
                let node = ListNode(item)
                current?.next = node
                current = node
            }
        }

        return reversed
    }

    /// This algorithm reverses a linked list in O(n) time and O(1) space complexity.
    /// - Parameter head: A pointer to the head of the linked list.
    /// - Returns: A pointer to the reversed linked list.
    func algorithm2(_ head: ListNode?) -> ListNode? {
        var current = head
        var prev: ListNode?
        var temp: ListNode?

        while(current != nil) {
            temp = current?.next
            current?.next = prev
            prev = current
            if temp != nil {
                current = temp
            } else {
                break
            }
        }

        return current
    }

    /// This algorithm reverses a linked list in O(n) time and O(N) space complexity using recursion.
    /// - Parameter head: A pointer to the head of the linked list.
    /// - Returns: A pointer to the reversed linked list.
    func algorithm3(_ head: ListNode?) -> ListNode? {
        if (head == nil || head?.next == nil) {
            return head
        }

        let node = algorithm3(head?.next)
        head?.next?.next = head
        head?.next = nil
        return node
    }
}

// MARK: Helpers

/// minimal stack implementation
private class Stack {
        private var memory: [Int] = []

        func push(_ value: Int) {
            memory.insert(value, at: memory.count)
        }

        func pop() -> Int? {
            return memory.popLast()
        }

        func size() -> Int {
            return memory.count
        }
    }
