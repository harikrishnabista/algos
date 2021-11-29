//
//  main.swift
//  algos
//
//  Created by Hari Bista on 11/15/21.
//  Copyright © 2021 Hari Bista. All rights reserved.
//

import Foundation

print("Hello, World!")
print("")

class Solution_mergeTwoLists {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1Runner = l1
        var l2Runner = l2
        
        var smallerNode: ListNode?
        if let l1Val = l1Runner?.val,
            let l2Val = l2Runner?.val,
            l1Val < l2Val {
            smallerNode = ListNode(l1Val)
            l1Runner = l1Runner?.next
        } else if let l2Val = l2Runner?.val {
            smallerNode = ListNode(l2Val)
            l2Runner = l2Runner?.next
        } else if let l1Val = l1Runner?.val {
            smallerNode = ListNode(l1Val)
            l1Runner = l1Runner?.next
        }
        
        let result = smallerNode
        var resultRunner = smallerNode
        
        while l1Runner != nil && l2Runner != nil {
            
            var newNode: ListNode?
            
            if let l1Val = l1Runner?.val,
                let l2Val = l2Runner?.val,
                    l1Val < l2Val {
                newNode = ListNode(l1Val)
                l1Runner = l1Runner?.next
            } else if let l2Val = l2Runner?.val {
                newNode = ListNode(l2Val)
                l2Runner = l2Runner?.next
            }

            resultRunner?.next = newNode
            resultRunner = resultRunner?.next
        }
        
        if let l1Runner = l1Runner {
            resultRunner?.next = l1Runner
        }
        
        if let l2Runner = l2Runner {
            resultRunner?.next = l2Runner
        }
        
        return result
    }
}


//[1,2,4]
//[1,3,4]

let arr2 = [1]
let arr1: [Int] = []

let l1 = convertArrayToLinkedList(arr: arr1)
let l2 = convertArrayToLinkedList(arr: arr2)

//print(convertLinkedListToArray(list: Solution_mergeTwoLists().mergeTwoLists(l1, l2)))


class Solution_hasPathSum {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        if root.left == nil && root.right == nil {
            return targetSum == root.val
        }
        
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }
}

//let treeNode = TreeFactory.createTreeFromArray(arr: [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1])
//print(Solution_hasPathSum().hasPathSum(treeNode, 22))


enum RideCategory: String, CustomStringConvertible {
    case family
    case kids
    case thrill
    case scary
    case relaxing
    case water
    
    var description: String {
        return rawValue
    }
}

typealias Minutes = Double
struct Ride: CustomStringConvertible {
    let name: String
    let categories: Set<RideCategory>
    let waitTime: Minutes
    
    var description: String {
        return "Ride –\"\(name)\", wait: \(waitTime) mins, " +
        "categories: \(categories)\n"
    }
}


let parkRides = [
    Ride(name: "Raging Rapids",
         categories: [.family, .thrill, .water],
         waitTime: 45.0),
    Ride(name: "Crazy Funhouse", categories: [.family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", categories: [.kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", categories: [.scary], waitTime: 30.0),
    Ride(name: "Thunder Coaster",
         categories: [.family, .thrill],
         waitTime: 60.0),
    Ride(name: "Grand Carousel", categories: [.family, .kids], waitTime: 15.0),
    Ride(name: "Bumper Boats", categories: [.family, .water], waitTime: 25.0),
    Ride(name: "Mountain Railroad",
         categories: [.family, .relaxing],
         waitTime: 0.0)
]


//let totalWaitTime = parkRides.reduce(0.0) { (total, ride) in
//    total + ride.waitTime
//}

let totalWaitTime = parkRides.reduce(0.0) { (total, ride) -> Double in
    return total + ride.waitTime
}

//print(totalWaitTime)

class Solution_rotate {
    func rotate(_ matrix: inout [[Int]]) {
        
        // position
        var p = 0
        
        // size
        var s = matrix.count
        
        while s > 0 {
            
            for i in 0...s-2 {
//                var row =
//                var col = p + i
//
//                var firstItem =
//
//                var secondItem = matrix[]
                
                let arr = [matrix[p][p+i], matrix[p+i][s-1], matrix[s-1][s-1-i], matrix[s-1-i][p]]
                
                print(arr)
                print("")
            }
            
            p = p + 1
            s = s - 2
        }
        
    }
}

var matrix = [
                [1,2,3,4],
                [5,6,7,8],
                [9,10,11,12],
                [13,14,15,16]
             ]

// Solution_rotate().rotate(&matrix)


class Solution_preorderTraversal {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        guard let root = root else { return result }
        result.append(root.val)
        result.append(contentsOf: preorderTraversal(root.left))
        result.append(contentsOf: preorderTraversal(root.right))
        
        return result
    }
}

//print(Solution_preorderTraversal().preorderTraversal(TreeFactory.createTreeFromArray(arr: [1,2,3,4,5])))

class Solution_removeElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var nonValIndex = 0
        
        for item in nums {
            if item != val {
                nums[nonValIndex] = item
                nonValIndex = nonValIndex + 1
            }
        }

        return nonValIndex
    }
}

// let inputArr = [3, 3, 2, 2]
//print(Solution_removeElement().removeElement(&inputArr, 3))



class Solution_uniquePaths {
    
    var storage:[String: Int] = [:]
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        if m < 1 || n < 1 {
            return 0
        }
        
        if m == 1 && n == 1 {
            return 1
        }

        if let count = self.storage["\(m)_\(n)"] {
            return count
        }
        
        let totalCount = uniquePaths(m-1,n) + uniquePaths(m,n-1)
        self.storage["\(m)_\(n)"] = totalCount
        
        return totalCount
    }
}

//print(Solution_uniquePaths().uniquePaths(3, 7))

class Solution_searchInsert {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var u = nums.count - 1
        
        var m = 0
        
        while l <= u {
            m = (l + u)/2
            
            if nums[m] == target {
                return m
            } else if target < nums[m] {
                u = m - 1
            } else {
                l = m + 1
            }
        }

        return u + 1
    }
}

//print(Solution_searchInsert().searchInsert([1,3,5,6], 4))


/**
 * The knows API is defined in the parent class VersionControl.
 *
 */

class Solution_firstBadVersion {
    
    func isBadVersion(_ version: Int) -> Bool{
        return true
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1
        var u = n
        
        while l <= u {
            let m = (l + u)/2
            if isBadVersion(m) {
                if !isBadVersion(m-1) {
                    return m
                }
                u = m - 1
            } else {
                l = m + 1
            }
        }
        
        return 1
    }
}


class Solution_rightSideView {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var result: [Int] = []
        result.append(root.val)
        result.append(contentsOf: rightSideView(root.right))
        return result
    }
}


class Solution_minDepth {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return minDepth(root, height: 1)
    }
    
    private func minDepth( _ root: TreeNode, height: Int) -> Int {
        if root.left == nil && root.right == nil {
            return height
        } else {
            var leftMinDepth = Int.max
            if let leftNode = root.left {
                leftMinDepth = minDepth(leftNode, height: height + 1)
            }
            
            var rightMinDepth = Int.max
            if let rightNode = root.right {
                rightMinDepth = minDepth(rightNode, height: height + 1)
            }
            
            return min(leftMinDepth, rightMinDepth)
        }
    }
}

//print(Solution().minDepth(TreeFactory.createTreeFromArray(arr: [3,9,20,nil,nil,15,7])))

//let input1 = TreeFactory.createTreeFromArray(arr: [2,nil,3,nil,4,nil,5,nil,6])
//print(Solution().minDepth(input1))

//print(Solution().minDepth(nil))


class Solution_climbStairs {
    var countedHistory:[Int:Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        
        if n < 0 {
            return 0
        }
        
        if let alreadyCounted = self.countedHistory[n] {
            return alreadyCounted
        }
        
        let result = climbStairs(n - 1) + climbStairs(n - 2)

        self.countedHistory[n] = result
        
        return result
    }
}

//print(Solution_climbStairs().climbStairs(3))

class Solution_isValidSudoku {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // valid rows
        for row in board {
            if validateItems(charArr: row) == false {
                return false
            }
        }
        
        // valid columns
        for j in 0...(board[0].count-1) {
            
            var tempArr:[Character] = []
            for i in 0...(board.count-1) {
                tempArr.append(board[i][j])
            }
            
            if validateItems(charArr: tempArr) == false {
                return false
            }
            
            tempArr = []
        }
        
        
        // valid small squares
        return false
    }
    
    func validateItems(charArr: [Character]) -> Bool {
        var checker:[Character: Bool] = [:]
        
        for ch in charArr {
            if ch != "." {
                if checker[ch] != nil {
                    return false
                } else {
                    checker[ch] = true
                }
            }
        }
        
        return false
    }
}


class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        // initialize checker of same size as grid
        let gridSizeEmptyArray = [Bool](repeating: false, count: grid[0].count)
        self.visited = [[Bool]](repeating: gridSizeEmptyArray, count: grid.count)
        
        // count islands inside grid
        var islandsCounter = 0
        for i in 0...(grid.count-1) {
            for j in 0...(grid[0].count-1) {
                if !visited[i][j] && self.isIsland(grid: grid, i: i, j: j) {
                    islandsCounter = islandsCounter + 1
                }
            }
        }
        return islandsCounter
    }
    
    private var visited: [[Bool]] = []
    
    private func isIsland(grid: [[Character]], i: Int, j: Int) -> Bool {
        if grid[i][j] == "1" && visited[i][j] == false {
            
            visited[i][j] = true
            
            // travel right
            if j+1 < grid[0].count {
                isIsland(grid: grid, i: i, j: j+1)
            }
            
            // travel bottom
            if i+1 < grid.count {
                isIsland(grid: grid, i: i+1, j: j)
            }
            
            // left
            if j-1 >= 0 {
                isIsland(grid: grid, i: i, j: j-1)
            }
            
            // top
            if i-1 >= 0 {
                isIsland(grid: grid, i: i-1, j: j)
            }
            
            return true
        } else {
            return false
        }
    }
}

let grid: [[Character]] = [["1","1","1"],
            ["0","1","0"],
            ["1","1","1"]]

//let grid: [[Character]] = [
//  ["1","1","1","1","0"],
//  ["1","1","0","1","0"],
//  ["1","1","0","0","0"],
//  ["0","0","1","0","1"]
//]

print(Solution().numIslands(grid))
