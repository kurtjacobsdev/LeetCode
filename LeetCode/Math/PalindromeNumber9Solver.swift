//
//  PalindromeNumber9.swift
//  LeetCode
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import Foundation

enum PalindromNumber9Algorithm {
    case strings
    case ints
}

class PalindromeNumber9Solver {
    func solve(_ x: Int, algorithm: PalindromNumber9Algorithm) -> Bool {
        switch algorithm {
        case .strings:
            return algorithm1(x)
        case .ints:
            return algorithm2(x)
        }
    }


    /// This algorithm determines whether a number is a palindrome. Negative numbers are automatically discarded. Time complexity O(n) space complexity O(n).
    /// - Parameter x: The number.
    /// - Returns: Whether the number is palindrome.
    func algorithm1(_ x: Int) -> Bool {
        guard x > 0 else { return false }
        let str = String(x)
        guard str.count > 1 else { return false }
        guard str.count != 1 else { return true }

        for i in 0..<str.count / 2 {
            let left = str.characterAt(index: i)
            let right = str.characterAt(index: str.count-i-1)
            if left != right { return false }
        }
        return true
    }

    /// This algorithm determines whether a number is a palindrome. Negative numbers are automatically discarded. Time complexity O(n) space complexity O(1).
    /// - Parameter x: The number.
    /// - Returns: Whether the number is palindrome.
    func algorithm2(_ x: Int) -> Bool {
        guard x > 0 else { return false }
        var number = x
        var reverseNumber = 0
        while number > 0 {
            let remainder = number % 10
            reverseNumber = reverseNumber * 10 + remainder
            number = number / 10
        }
        return x == reverseNumber
    }
}

// MARK: Helpers

private extension String {
    func characterAt(index: Int) -> Character {
        return self[String.Index(utf16Offset: index, in: self)]
    }
}
