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
        
        let name = "alex"
        let typed = "aaleex"
        
        print(self.isLongPressedName(name, typed))
        
        let S = "asdasfasdasdasdlkjlkjlkjlkjlkj"
        print(self.partitionLabels(S))
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
