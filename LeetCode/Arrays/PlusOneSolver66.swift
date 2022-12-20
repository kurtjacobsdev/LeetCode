//
//  PlusOneSolver66.swift
//  LeetCode
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import Foundation

enum PlusOneSolver66Algorithm {
    case copy
    case inplace
}

class PlusOneSolver66 {
    func solve(_ digits: [Int], alogrithm: PlusOneSolver66Algorithm) -> [Int] {
        var digits = digits
        switch alogrithm {
        case .copy:
            return algorithm1(digits)
        case .inplace:
            return algorithm2(&digits)
        }
    }

    /// This algorithm adds one to a digit array. Time complexity O(n), space complexity O(n). Can be improved by passing the array by reference.
    /// - Parameter digits: The digit array
    /// - Returns: The digit array incremented by one.
    func algorithm1(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in 0..<digits.count {
            let current = digits[digits.count-1-i]
            if current + 1 <= 9 {
                digits[digits.count-1-i] = digits[digits.count-1-i] + 1
                break
            } else {
                digits[digits.count-1-i] = 0
            }
            if i == digits.count-1 {
                digits.insert(1, at: 0)
            }
        }
        return digits
    }

    /// This algorithm adds one to a digit array. Time complexity O(n), space complexity O(1).
    /// - Parameter digits: The digit array
    /// - Returns: The digit array incremented by one.
    func algorithm2(_ digits: inout [Int]) -> [Int] {
        for i in 0..<digits.count {
            let current = digits[digits.count-1-i]
            if current + 1 <= 9 {
                digits[digits.count-1-i] = digits[digits.count-1-i] + 1
                break
            } else {
                digits[digits.count-1-i] = 0
            }
            if i == digits.count-1 {
                digits.insert(1, at: 0)
            }
        }
        return digits
    }
}
