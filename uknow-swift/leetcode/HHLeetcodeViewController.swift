//
//  HHLeetcodeViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/10/22.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHLeetcodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        // Do any additional setup after loading the view.
        
//        let name = "alex"
//        let typed = "aaleex"
//
//        print(self.isLongPressedName(name, typed))
//
//        let S = "asdasfasdasdasdlkjlkjlkjlkjlkj"
//        print(self.partitionLabels(S))
//        let root = TreeNode()
//        root.val = 1
//        root.left = TreeNode()
//        root.right = TreeNode()
//        root.right?.val = 2
//        root.right?.left = TreeNode()
//        root.right?.left?.val = 3
//        print(self.preorderTraversal(root))
//
//        print(self.uniqueOccurrences([1,2,2,1,1,3]))
        
        print(self.maximumGap([15252,16764,27963,7817,26155,20757,3478,22602,20404,6739,16790,10588,16521,6644,20880,15632,27078,25463,20124,15728,30042,16604,17223,4388,23646,32683,23688,12439,30630,3895,7926,22101,32406,21540,31799,3768,26679,21799,23740]))
    }
    
        func maximumGap(_ nums: [Int]) -> Int {
            if nums.count < 2 {
                return 0
            }
            var numsArray = [Int]()
//            var a = nums[0]
//            numsArray.append(a)
            
            for i in 0..<nums.count {
                for j in 0..<numsArray.count {
                    if nums[i] > numsArray[j] {
                        numsArray.insert(i, at: j)
                        continue
                    }
                }
//                let b = nums[i]
//                if (b < a) {
//                    numsArray.insert(b, at: 0)
//                    a = b
//                    continue
//                }
                
            }
            var result = 0
            var f = numsArray[0]
            for j in numsArray {
                if (j - f) > result {
                    result = j - f
                }
                f = j
            }
            return result
        }
    
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//            var arr = [Int]()
//            for i in nums1 {
//                for j in nums2 {
//                    if i == j && !arr.contains(i){
//                        arr.append(i)
//                    }
//                }
//            }
//        return arr
        return Array(Set(nums1).intersection(Set(nums2)))
    }
    
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map = [Int: Int]()
        var list = [Int]()
        for value in arr {
            map[value] = (map[value] ?? 0) + 1
        }
        for num in map.values {
            if list.contains(num) {
                return false
            }
            list.append(num)
        }
        return true
    }
    
    var list = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        preorder(root)
        return list
    }
    func preorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        list.append(root.val)
        preorder(root.left)
        preorder(root.right)
    }
    
    func partitionLabels(_ S: String) -> [Int] {
        let arr = Array(S)
        var charLastMap : [Character: Int] = [:]
        for i in 0..<arr.count {
            charLastMap[arr[i]] = i
        }
        var partition : [Int] = []
        var start = 0
        var end = 0
        for i in 0..<arr.count {
            let last = charLastMap[arr[i]]
            end = max(end, last!)
            if end == i {
                partition.append(end - start + 1)
                start = end + 1
            }
        }
        
        return partition
    }
    
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        
        var i = 0
        var j = 0
        let nameArray = Array(name)
        let typedArray = Array(typed)
        while j < typedArray.count {
            if i < nameArray.count && nameArray[i] == typedArray[j] {
                i += 1
                j += 1
            }else if j > 0 && typedArray[j] == typedArray[j - 1] {
                j += 1
            }else {
                return false
            }
        }
        return i == name.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
