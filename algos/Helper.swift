//
//  Helper.swift
//  Console
//
//  Created by Hari Bista on 9/25/21.
//  Copyright © 2021 Hari Bista. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BSTNode {
    public var val: Int
    public var left: BSTNode?
    public var right: BSTNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: BSTNode?, _ right: BSTNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func insert(node: BSTNode?){
        guard let node = node else {
            return
        }
        
        self.insert(node: node, into: self)
    }
    
    private func insert(node: BSTNode, into root: BSTNode) {
        if node.val < root.val {
            // insert into left node
            if let leftNode = root.left {
                self.insert(node: node, into: leftNode)
            } else {
                root.left = node
            }
            
        } else {
            // insert into right node
            if let rightNode = root.right {
                self.insert(node: node, into: rightNode)
            } else {
                root.right = node
            }
        }
    }
    
    func delete(node: BSTNode) {
        
    }
}

class TreeFactory {
    class func createTreeFromArray(arr: [Int?]) -> TreeNode? {
        
        let root: TreeNode = TreeNode(arr[0] ?? 0)
        var queue: [TreeNode] = [root]
        
        var i = 1
        while i < arr.count  {
            let currNode = queue.removeFirst()
            
            if let val = arr[i] {
                currNode.left = TreeNode(val)
            } else {
                currNode.left = nil
            }
            
            i = i + 1
            
            if let leftNode = currNode.left {
                queue.append(leftNode)
            }
            
            if i < arr.count {
                if let val = arr[i] {
                    currNode.right = TreeNode(val)
                } else {
                    currNode.right = nil
                }

                if let rightNode = currNode.right {
                    queue.append(rightNode)
                }
                i = i + 1
            }
        }
        
        return root
    }
}

class LinkedListFactory {
    class func convertArrayToLinkedList(arr:[Int]) -> ListNode? {
        if arr.count == 0 { return nil }
        
        let root: ListNode? = ListNode(arr[0])
        
        if arr.count == 1 {
            return root
        }
        
        var runnerNode: ListNode? = root
        for i in 1...(arr.count - 1) {
            runnerNode?.next = ListNode(arr[i])
            runnerNode = runnerNode?.next
        }
        
        return root
    }

    class func convertLinkedListToArray(list: ListNode?) -> [Int] {
        var runnerNode = list
        var result: [Int] = []
        
        while runnerNode != nil {
            if let runnerNode = runnerNode {
                result.append(runnerNode.val)
            }
            runnerNode = runnerNode?.next
        }
        return result
    }
}
