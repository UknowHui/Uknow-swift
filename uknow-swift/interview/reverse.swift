//
//  reverse.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/8.
//  Copyright © 2018年 uknow. All rights reserved.
//

import UIKit

class reverse: UIViewController{
    
    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        print(reverseWords(s: "this sky is blue") as Any)
    }
}

extension reverse {
    
    func reverseWords(s: String?) -> String? {
        guard let s = s else {
            return nil
        }
        var chars = Array(s.characters), start = 0
        _reverse(&chars, 0, chars.count - 1)
        
        for i in 0 ..< chars.count {
            if i == chars.count - 1 || chars[i + 1] == " " {
                _reverse(&chars, start, i)
                start = i + 2
            }
        }
        return String(chars)
    }
    
    fileprivate func _reverse<T>(_ chars: inout [T], _ start:Int, _ end:Int) {
        
        var start = start, end = end
        
        while start < end {
            
            swap(&chars, start, end)
            start += 1
            end -= 1
        }
        
        
    }
    
    fileprivate func swap<T>(_ chars:inout [T], _ p:Int, _ q:Int) {
        (chars[p], chars[q]) = (chars[q], chars[p])
    }
}
