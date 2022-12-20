//
//  TwoSum1.swift
//  LeetCode
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import Foundation

public enum TwoSumSolver1Algorithm {
    case linear
    case quadratic
}

public class TwoSumSolver1 {
    public func solve(_ nums: [Int], _ target: Int, _ algorithm: TwoSumSolver1Algorithm) -> [Int] {
        switch algorithm {
        case .quadratic:
            return algorithm1(nums, target)
        case .linear:
            return algorithm2(nums, target)
        }
    }

    /// This algorithm calculates which sum of array indicies equal the target value. Time complexity O(n^2), space complexity O(1)
    /// - Parameters:
    ///   - nums: The list of numbers
    ///   - target: The target value
    /// - Returns: The indicies that sum up to the target value.
    func algorithm1(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<(nums.count - 1) {
            for j in (i+1)..<(nums.count) {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }


    /// This algorithm calculates which sum of array indicies equal the target value. Time complexity O(n), space complexity O(n)
    /// - Parameters:
    ///   - nums: The list of numbers
    ///   - target: The target value
    /// - Returns: The indicies that sum up to the target value.
    func algorithm2(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for i in 0..<(nums.count) {
            let diff = target - nums[i]
            if map[nums[i]] != nil {
                return [i, map[nums[i]]!]
            }
            else {
                map[diff] = i
            }
        }
        return []
    }
}
