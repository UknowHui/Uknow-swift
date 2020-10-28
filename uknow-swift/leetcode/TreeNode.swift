//
//  TreeNode.swift
//  uknow-swift
//
//  Created by uknow on 2020/10/27.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class TreeNode: NSObject {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public override init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left:TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
