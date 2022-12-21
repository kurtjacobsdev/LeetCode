//
//  RemoveElementSolver27.swift
//  LeetCode
//
//  Created by Kurt Jacobs on 2022/12/20.
//

import Foundation

enum RemoveElementSolver27Algorithm {
    case inplace
    case inplace2
    case inplace3
}

class RemoveElementSolver27 {
    func solve(_ nums: [Int], _ val: Int, algorithm: RemoveElementSolver27Algorithm) -> Int {
        var nums = nums
        switch algorithm {
        case .inplace:
            return algorithm1(&nums, val)
        case .inplace2:
            return algorithm2(&nums, val)
        case .inplace3:
            return algorithm3(&nums, val)
        }
    }

    /// This algorithm removes all occurences of val from the input array nums. Time complexity O(n^2), space complexity O(n).
    /// - Parameters:
    ///   - nums: The input array.
    ///   - val: The value to remove.
    /// - Returns: The array without occurences of val.
    func algorithm1(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 { return 0 }
        var size = 0
        for index in 0..<nums.count {
            let tailIndex = getTail(&nums, val)
            if nums[index] != val {
                size += 1
                continue
            }
            if tailIndex > index {
                swap(nums: &nums, index: index, index2: tailIndex)
                size+=1
            }
        }
        return size
    }

    /// This algorithm removes all occurences of val from the input array nums. Time complexity O(n^2), space complexity O(1).
    /// - Parameters:
    ///   - nums: The input array.
    ///   - val: The value to remove.
    /// - Returns: The array without occurences of val.
    func algorithm2(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 { return 0 }
        var size = 0
        var tail = nums.count - 1
        for index in 0..<nums.count {
            if nums[index] != val {
                size += 1
                continue
            }
            else {
                while nums[tail] == val {
                    tail -= 1
                    if tail == -1 { return size }
                }
                if tail >= index {
                    swap(nums: &nums, index: index, index2: tail)
                    size += 1
                }
            }
        }
        return size
    }

    /// This algorithm removes all occurences of val from the input array nums. Time complexity O(n), space complexity O(1).
    /// - Parameters:
    ///   - nums: The input array.
    ///   - val: The value to remove.
    /// - Returns: The array without occurences of val.
    func algorithm3(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 { return 0 }
        var size = 0
        for index in 0..<nums.count {
            if nums[index] != val {
                size += 1
            }
            else {
                swap(nums: &nums, index: index, index2: index-size)
            }
        }

        for i in 0..<(nums.count / 2) {
            swap(nums: &nums, index: i, index2: nums.count-i-1)
        }

        return size
    }
}

// MARK: Helpers

private func getTail(_ nums: inout [Int], _ val: Int) -> Int {
    for (index, value) in nums.reversed().enumerated() {
        if value != val { return nums.count - 1 - index }
    }
    return 0
}

private func swap(nums: inout [Int], index: Int, index2: Int) {
    let temp = nums[index2]
    nums[index2] = nums[index]
    nums[index] = temp
}

